#! /bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install openjdk-11-jdk -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo ufw allow 8080

sudo apt install docker.io -y
sudo service docker start

# # # more
# sudo apt install curl
# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# #         # sudo apt-get install python-pip -y
#         # sudo pip install docker-compose

# curl -sO http://52.50.185.200:8080/jnlpJars/agent.jar 
# java -jar agent.jar -jnlpUrl http://52.50.185.200:8080/computer/RS/jenkins-agent.jnlp -secret 0656cf4a3693931b66f49f7bd2be7d1a0ea062f0f3c4c8dcf0c1cefe4ef1848b -workDir "/home/ubuntu/jenkins"