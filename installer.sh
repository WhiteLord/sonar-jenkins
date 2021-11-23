#!/bin/bash

SONAR_POSTGRES_USER='sonar'
SONAR_POSTGRES_PASSWORD='password'
SONAR_POSTGRES_DATABASE_NAME='sonar_db'
SONAR_WEB_HOST=192.168.0.101

# Install maven, nginx and chromium
sudo apt install maven nginx chromium-browser
export CHROME_BIN='/usr/bin/chromium-browser'

sudo apt install openjdk-8-jdk -y
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install oracle-java11-set-default-local

# Install and start Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y

# Install postgre
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install postgresql postgresql-contrib -y

# Configure postgre to include default sonar databse and user 
sudo -u postgres psql -c "CREATE USER $SONAR_POSTGRES_USER"
sudo -u postgres psql -c "ALTER USER $SONAR_POSTGRES_USER WITH ENCRYPTED PASSWORD '$SONAR_POSTGRES_PASSWORD'"
sudo -u postgres psql -c "CREATE DATABASE $SONAR_POSTGRES_DATABASE_NAME OWNER $SONAR_POSTGRES_USER"

# Install and configure SonarQube
sudo adduser $SONAR_POSTGRES_USER
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.2.0.32929.zip
sudo apt install unzip
unzip sonarqube-8.2.0.32929.zip
rm -rf sonarqube-8.2.0.32929.zip
sudo mv sonarqube-8.2.0.32929 /opt/sonar
sudo chown -R $SONAR_POSTGRES_USER:$SONAR_POSTGRES_USER /opt/sonar
echo -e "Changing $SONAR_POSTGRES_USER properties file permissions..."
sudo chmod 777 /opt/sonar/conf/sonar.properties
echo -e "sonar.jdbc.username=$SONAR_POSTGRES_USER \nsonar.jdbc.password=$SONAR_POSTGRES_PASSWORD \nsonar.jdbc.url=jdbc:postgresql://localhost/$SONAR_POSTGRES_DATABASE_NAME \nsonar.web.host=$SONAR_WEB_HOST \nsonar.search.javaOpts=-Xms512m -Xmx512m" >> /opt/sonar/conf/sonar.properties
echo "Updating elasticsearch max virtual memory..."
sudo sysctl -w vm.max_map_count=262144
echo "Jenkins secret:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
