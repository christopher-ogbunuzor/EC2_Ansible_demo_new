#!/bin/bash
apt-get update
apt-get install -y apache2

# Create a simple HTML file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>My Webpage</title>
</head>
<body>
    <h1>Welcome to my webpage!</h1>
    <p>This is a sample webpage for chinedu test.</p>
</body>
</html>
EOF

# Set permissions for the webpage files
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Restart Apache to apply the changes
systemctl restart apache2

sudo apt-get install firewalld -y
sudo apt-get install tcpdump -y
sudo apt-get install network-manager -y

sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload



