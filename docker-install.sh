
#Install Docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/
#================================
# this line looks for, and remove any existing installation of docker.
#sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# check install
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo gpasswd -a $USER docker
sudo usermod -a -G docker $USER
sudo -H -u root bash << EOF
# test Docker installation
docker run hello-world
EOF
