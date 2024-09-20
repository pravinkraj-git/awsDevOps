#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
if sudo systemctl is-active --quiet jenkins; then
  echo "Jenkins service started successfully"
else
  echo "Jenkins service failed to start" >&2
  sudo journalctl -xeu jenkins.service
  exit 1
fi

echo "Jenkins installation completed" >> /var/log/jenkins_install.log
