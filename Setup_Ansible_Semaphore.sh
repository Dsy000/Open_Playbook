# Installation Ansible Semaphore in DEB11:
wget https://github.com/ansible-semaphore/semaphore/releases/download/v2.8.75/semaphore_2.8.75_linux_amd64.deb
sudo dpkg -i semaphore_2.8.75_linux_amd64.deb

#install mariadb databases. 
sudo apt install mariadb-server

#inatsll ansible
sudo apt install ansible
sudo apt install sshpass

#Add below line in /etc/ssh/ssh_config
vim /etc/ssh/ssh_config
---------------------------------
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

---------------------------------
sudo systemctl restart sshd




