#!/bin/bash
sudo yum update
#install wget
sudo yum install wget -y
#install java-11
sudo yum install java-11-openjdk-devel -y
#maven setup
cd /usr/local/src/
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
sudo tar -xvzf apache-maven-3.8.5-bin.tar.gz
sudo mv apache-maven-3.8.5 apache-maven
sudo rm -rf apache-maven-3.8.5-bin.tar.gz
cd /etc/profile.d/
touch maven.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64
export M2_HOME=/usr/local/src/apache-maven
export MAVEN_HOME=/usr/local/src/apache-maven
export PATH=/usr/local/src/apache-maven/bin:/usr/local/src/apache-maven/bin" >> /etc/profile.d/maven.sh
cd /etc/profile.d/
sudo chmod +x maven.sh
source maven.sh
