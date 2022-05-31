#!/bin/bash
sudo yum install wget -y
sudo yum install java-11-openjdk-devel -y
sudo yum install unzip -y
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.zip
unzip apache-tomcat-9.0.63.zip
mv apache-tomcat-9.0.63 tomcat
rm -rf apache-tomcat-9.0.63.zip
cd /opt/tomcat/bin
chmod u+x *.sh
sh /opt/tomcat/bin/startup.sh
ln -s /opt/tomcat/bin/startup.sh /usr/bin/startTomcat
ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/stopTomcat
startTomcat
#stopTomcat
