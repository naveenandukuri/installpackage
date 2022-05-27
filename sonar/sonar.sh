#sonarqube setup
sudo - i
cd /opt/
#install wget and unzip
sudo yum install wget -y
sudo yum install unzip -y
#install java-11
sudo yum install java-11-openjdk-devel -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo useradd sonar
# Run me with superuser privileges
sudo echo 'sonar  ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
cd /opt/
sudo chown -R sonar:sonar /opt/sonarqube-7.8/
sudo chmod -R 775 /opt/sonarqube-7.8/
su - sonar
cd /opt/sonarqube-7.8/bin/linux-x86-64/
./sonar.sh start
./sonar.sh status

