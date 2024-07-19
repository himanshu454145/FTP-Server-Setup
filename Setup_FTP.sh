#!/bin/bash
echo "RUNNING FTP SERVER VSFTPD INSTALLATION";


sudo apt-get update;

sudo apt-get install -y vsftpd;


sudo systemctl start vsftpd;
sudo systemctl enable vsftpd;


sudo mv /etc/vsftpd.conf /etc/vsftpd.conf_default;

# Download the new vsftpd configuration file
wget -O /etc/vsftpd.conf https://www.dropbox.com/s/2ef1bzip0g6essp/vsftpd.conf?dl=0;


sudo adduser admin;


sudo mkdir -p /home/admin/ftp/files;


sudo chown nobody:nogroup /home/admin/ftp;
sudo chmod a-w /home/admin/ftp;
sudo chown admin:admin /home/admin/ftp/files;


sudo ufw allow 20/tcp;
sudo ufw allow 21/tcp;


sudo systemctl restart vsftpd;

echo "FTP SERVER VSFTPD INSTALLATION COMPLETED";
