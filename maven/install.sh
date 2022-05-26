#!/bin/bash
sudo yum update
#install wget and unzip
sudo yum install wget -y
sudo yum install unzip -y
#install java-11
sudo yum install java-11-openjdk-devel -y
#maven setup
cd /usr/local/src
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
sudo tar -xvzf apache-maven-3.8.5-bin.tar.gz
sudo mv apache-maven-3.8.5 apache-maven
sudo rm -rf apache-maven-3.8.5-bin.tar.gz
cd /etc/profile.d
touch maven.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64
export M2_HOME=/usr/local/src/apache-maven
export MAVEN_HOME=/usr/local/src/apache-maven
export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
sudo chmod +x maven.sh
source maven.sh

#sonarqube setup
sudo - i
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo useradd sonar
# Run me with superuser privileges
sudo echo 'sonar  ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
sudo chown -R sonar:sonar /opt/sonarqube-7.8/
sudo chmod -R 775 /opt/sonarqube-7.8/
su - sonar
cd /opt/sonarqube-7.8/bin/linux-x86-64/
./sonar.sh start
./sonar.sh status

