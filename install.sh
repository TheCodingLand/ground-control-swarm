sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg [download.docker.com] | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname [github.com] -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo gpasswd -a $USER docker

sudo docker create network web
sudo docker stack deploy ground-control.yml
sudo docker stack deploy monitoring.yml
