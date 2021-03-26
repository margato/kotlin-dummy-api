#!/bin/bash
############## Declarations ###############
update_api() {
    cd ~/kotlin-dummy-api
    sudo git pull
    rm -rf build
    mvn clean package
    update_service
}

update_service() {
    cd ~/kotlin-dummy-api
    sudo mv build/dummy-api.jar /var/dummy-api/dummy-api.jar
    sudo mv dummy-api.service /etc/systemd/system/dummy-api.service 
    sudo systemctl daemon-reload
    sudo chmod +x /var/dummy-api/dummy-api.jar
    sudo systemctl enable dummy-api
    sudo systemctl stop dummy-api
    sudo systemctl start dummy-api   
}

###########################################
################# Java 11 ################# 

sudo amazon-linux-extras install java-openjdk11 -y
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.9.11-0.amzn2.0.1.x86_64

################## Maven ################## 
export MVN_VERSION=3.6.3
cd /usr/local
sudo wget https://downloads.apache.org/maven/maven-3/$MVN_VERSION/binaries/apache-maven-$MVN_VERSION-bin.tar.gz
sudo tar xvf apache-maven-$MVN_VERSION-bin.tar.gz
sudo rm apache-maven-$MVN_VERSION-bin.tar.gz

export M2_HOME=/usr/local/apache-maven-$MVN_VERSION
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

################### Git ################### 
sudo yum install git -y

################### API ################### 

# Clone API
cd ~
sudo git clone https://github.com/margato/kotlin-dummy-api
sudo mkdir /var/dummy-api
update_api
forward_ports


# sudo tail -10 /var/log/cloud-init-output.log