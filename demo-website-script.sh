#!/bin/bash

dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>AWS EC2</title>
<style>
body{
    font-family:Arial,sans-serif;
    background:#232F3E;
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    margin:0;
}
.container{
    text-align:center;
}
h1{
    color:#FF9900;
}
</style>
</head>
<body>
<div class="container">
    <h1>🚀 Welcome to AWS EC2</h1>
    <h2>Amazon Linux 2023 + Apache</h2>
    <p>Your EC2 instance is running successfully.</p>
</div>
</body>
</html>
EOF
