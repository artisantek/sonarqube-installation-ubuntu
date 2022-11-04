#!/bin/bash

echo "\n################################################################"
echo "#                                                              #"
echo "#                     ***Artisan Tek***                        #"
echo "#                  Sonarqube  Installation                     #"
echo "#                                                              #"
echo "################################################################"

# Installing necessary packages
echo "\n\n*****Installing necessary packages"
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y default-jre unzip > /dev/null 2>&1
echo "            -> Done"

# Downloading SonarQube 9.7.1 version to OPT folder
echo "*****Downloading SonarQube 9.7.1 version"
cd /opt 
sudo rm -rf sonarqube*
sudo wget -q https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.7.1.62043.zip
sudo unzip -q sonarqube-9.7.1.62043.zip -d /opt/sonarqube 1>/dev/null
sudo useradd -r -m -U -d /opt/sonarqube -s /bin/false sonarqube 2>/dev/null
sudo chown -R sonarqube: /opt/sonarqube
sudo rm -rf sonarqube-9.7.1.62043.zip
echo "            -> Done"

# Starting SonarQube Service
echo "*****Starting SonarQube Server"
cd /opt
./sonarqube/sonarqube-9.7.1.62043/bin/linux-x86-64/sonar.sh start 1>/dev/null


# Check if SonarQube is working
echo "\n################################################################ \n"
if [ $? -eq 0 ]; then
	echo "SonarQube installed Successfully"
	echo "Access SonarQube using $(curl -s ifconfig.me):9000"
else
	echo "SonarQube installation failed"
fi
echo "\n################################################################ \n"

