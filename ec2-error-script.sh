#!/bin/bash

# ==========================================================
# EC2 Diagnostic Script
# Usage: bash ec2_diagnostic.sh
# Yeh script OS Layer aur Application Layer ke common
# checks ek saath run karta hai aur clean output deta hai.
# ==========================================================

# Colors for readability
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

section() {
    echo -e "\n${YELLOW}==================== $1 ====================${NC}"
}

warn() {
    echo -e "${RED}⚠ $1${NC}"
}

ok() {
    echo -e "${GREEN}✔ $1${NC}"
}

echo -e "${GREEN}EC2 Diagnostic Report - $(date)${NC}"
echo "Hostname: $(hostname)"

# ----------------------------------------------------------
section "1. INSTANCE METADATA"
# ----------------------------------------------------------
if curl -s --max-time 2 http://169.254.169.254/latest/meta-data/instance-id > /dev/null 2>&1; then
    echo "Instance ID   : $(curl -s http://169.254.169.254/latest/meta-data/instance-id)"
    echo "Instance Type : $(curl -s http://169.254.169.254/latest/meta-data/instance-type)"
    echo "AZ            : $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)"
    echo "Public IPv4   : $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null || echo 'N/A')"
    echo "Private IPv4  : $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
else
    warn "Metadata service reachable nahi hai (IMDS disabled ho sakta hai, ya IMDSv2 required hai)"
fi

# ----------------------------------------------------------
section "2. DISK USAGE"
# ----------------------------------------------------------
df -h --output=source,size,used,avail,pcent,target | grep -v tmpfs

DISK_USAGE=$(df --output=pcent / | tail -1 | tr -dc '0-9')
if [ "$DISK_USAGE" -ge 90 ]; then
    warn "Root disk $DISK_USAGE% full hai! Yeh crash/hang ka reason ho sakta hai."
elif [ "$DISK_USAGE" -ge 75 ]; then
    warn "Root disk $DISK_USAGE% use ho chuka hai - nazar rakho."
else
    ok "Disk usage normal hai ($DISK_USAGE%)"
fi

# ----------------------------------------------------------
section "3. MEMORY USAGE"
# ----------------------------------------------------------
free -h

MEM_AVAIL_PCT=$(free | awk '/Mem:/ {printf "%.0f", $7/$2 * 100}')
if [ "$MEM_AVAIL_PCT" -le 10 ]; then
    warn "Available memory sirf $MEM_AVAIL_PCT% bacha hai - OOM kill ho sakta hai."
else
    ok "Memory usage theek hai ($MEM_AVAIL_PCT% available)"
fi

# ----------------------------------------------------------
section "4. CPU LOAD"
# ----------------------------------------------------------
echo "Load Average (1m, 5m, 15m):"
uptime

CPU_CORES=$(nproc)
LOAD1=$(uptime | awk -F'load average:' '{print $2}' | cut -d, -f1 | tr -d ' ')
echo "CPU Cores: $CPU_CORES"

# ----------------------------------------------------------
section "5. RECENT KERNEL / SYSTEM MESSAGES (dmesg)"
# ----------------------------------------------------------
echo "Last 20 kernel log lines (OOM kill, disk errors, hardware issues yahan dikhenge):"
dmesg 2>/dev/null | tail -20 || warn "dmesg access ke liye sudo chahiye ho sakta hai"

if dmesg 2>/dev/null | grep -qi "out of memory\|oom-killer"; then
    warn "OOM (Out of Memory) kill events mile hain dmesg me!"
fi

# ----------------------------------------------------------
section "6. SYSTEM LOG - RECENT ERRORS"
# ----------------------------------------------------------
if [ -f /var/log/messages ]; then
    LOGFILE="/var/log/messages"
elif [ -f /var/log/syslog ]; then
    LOGFILE="/var/log/syslog"
else
    LOGFILE=""
fi

if [ -n "$LOGFILE" ]; then
    echo "Checking $LOGFILE for errors (last 50 matches):"
    grep -iE "error|fail|denied|critical" "$LOGFILE" 2>/dev/null | tail -50
else
    warn "/var/log/messages ya /var/log/syslog nahi mila"
fi

# ----------------------------------------------------------
section "7. RUNNING PROCESSES (Top by CPU & Memory)"
# ----------------------------------------------------------
echo "-- Top 5 CPU consuming processes --"
ps aux --sort=-%cpu | head -6

echo -e "\n-- Top 5 Memory consuming processes --"
ps aux --sort=-%mem | head -6

# ----------------------------------------------------------
section "8. LISTENING PORTS / SERVICES"
# ----------------------------------------------------------
if command -v ss > /dev/null; then
    ss -tulnp 2>/dev/null || sudo ss -tulnp
else
    netstat -tulnp 2>/dev/null || sudo netstat -tulnp
fi

# ----------------------------------------------------------
section "9. FAILED SYSTEMD SERVICES"
# ----------------------------------------------------------
if command -v systemctl > /dev/null; then
    FAILED=$(systemctl list-units --state=failed --no-legend 2>/dev/null)
    if [ -z "$FAILED" ]; then
        ok "Koi failed systemd service nahi hai"
    else
        warn "Yeh services fail hui hain:"
        echo "$FAILED"
    fi
else
    warn "systemctl available nahi hai is system pe"
fi

# ----------------------------------------------------------
section "10. COMMON WEB SERVER LOGS (agar exist karte hain)"
# ----------------------------------------------------------
for logpath in /var/log/nginx/error.log /var/log/httpd/error_log /var/log/apache2/error.log; do
    if [ -f "$logpath" ]; then
        echo "-- $logpath (last 20 lines) --"
        tail -20 "$logpath"
        echo ""
    fi
done

# ----------------------------------------------------------
section "11. NETWORK CONNECTIVITY CHECK"
# ----------------------------------------------------------
echo "Checking internet connectivity (DNS + reachability):"
if curl -s --max-time 3 https://www.google.com > /dev/null 2>&1; then
    ok "Outbound internet access working hai"
else
    warn "Outbound internet access FAIL ho raha hai - Security Group / NACL / Route Table check karo"
fi

echo -e "\nDNS Resolution test:"
if command -v nslookup > /dev/null; then
    nslookup google.com 2>&1 | head -5
elif command -v host > /dev/null; then
    host google.com 2>&1
fi

# ----------------------------------------------------------
section "SUMMARY"
# ----------------------------------------------------------
echo "Diagnostic complete. Upar jo bhi ⚠ (warning) dikha hai, wahi priority se check karo."
echo "Agar koi warning nahi hai but phir bhi issue hai, to Layer 1 (AWS Status Check)"
echo "aur Layer 2 (Security Group / NACL) AWS Console/CLI se check karo - yeh shell se"
echo "instance ke andar se fully verify nahi ho sakte."
