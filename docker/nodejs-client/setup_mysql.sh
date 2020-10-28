#!/bin/sh

# Steps, as described in README:
# https://github.com/GENIVI/ccs-w3c-client/blob/master/nodejs-ccs-driver/README.md

# Configure no to questions
# (most importantly the network access)
(echo "n\n" ;  yes y) | mysql_secure_installation --password=admin123

mysql -u root << EOT
CREATE USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin123';
CREATE USER 'admin'@'10.%.%.%' IDENTIFIED WITH mysql_native_password BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'10.%.%.%';
FLUSH PRIVILEGES;
exit
EOT

mysql -u admin --password=admin123 << EOT
CREATE DATABASE vssdatalake;
EOT

