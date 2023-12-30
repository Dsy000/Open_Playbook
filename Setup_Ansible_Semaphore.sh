# Installation Ansible Semaphore in DEB11:
wget https://github.com/ansible-semaphore/semaphore/releases/download/v2.8.75/semaphore_2.8.75_linux_amd64.deb
sudo dpkg -i semaphore_2.8.75_linux_amd64.deb

---------------------------------------
#install mariadb databases. 
sudo apt install mariadb-server
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
sudo mysql_secure_installation
~~~~~~~~~~~~
#Add user in mariadb db if required.
sudo mariadb
GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

---------------------------------------
#inatsll ansible
sudo apt install ansible
sudo apt install sshpass

#Add below line in /etc/ssh/ssh_config
vim /etc/ssh/ssh_config
---------------------------------------
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

---------------------------------------
sudo systemctl restart sshd

---------------------------------------
# Configured semaphore
semaphore setup


# Start Semaphore server
semaphore server --config /opt/config.json

------------------------------------------
# Create Semaphore systemd service.

sudo cat > /etc/systemd/system/semaphore.service <<EOF
[Unit]
Description=Semaphore Ansible
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/path/to/semaphore service --config=/opt/config.json
SyslogIdentifier=semaphore
Restart=always
RestartSec=10s

[Install]
WantedBy=multi-user.target
EOF

------------------------------------------
sudo systemctl daemon-reload
sudo systemctl start semaphore
sudo systemctl enable semaphore
sudo systemctl status semaphore


Open browser enter URL :  http://serverip:3000
