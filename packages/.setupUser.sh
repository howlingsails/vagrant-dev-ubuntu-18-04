# Create my default development file location      
echo "******************************"
echo "Create Default dev directory"
echo "******************************"

mkdir ~/dev

echo ""
echo ""

# Uncommet and replce user and token to add SSH key to bitbucket
#echo "------------------------------------------------------------------------------------------------"
#echo "Sending Curl For BitBucket"
#echo "------------------------------------------------------------------------------------------------"
#Username="blahUserblah"
#App Token create at : https://bitbucket.org/account/user/<USERNAME>/app-passwords
#apiToken="blahTokenBlah"
# curl -v -H "Content-Type: application/json" -d "$keydata" -X POST -u "$Username:$apiToken" https://api.bitbucket.org/2.0/users/$bucketUser/ssh-keys


#ensure non-interactive updates
export DEBIAN_FRONTEND=noninteractive 


echo "****************************************"
echo " Howling Sails Development Ubuntu 18.04"
echo "****************************************"


# echo "**************************************"
# echo "**************************************"
# echo "COPY sources.list"
# cp /packages/sources.list /etc/apt/sources.list
# echo "**************************************"
# echo "**************************************"

# echo "**************************************"
# echo " apt-get Update"
# echo "**************************************"
# 
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
# apt-get -y -q update



# cd /mnt
# echo "**************************************"
# echo "Tool mnt directory"
# echo "**************************************"
# ls /mnt
# echo "**************************************"
# echo "Trying to install guest additions"
# echo "**************************************"
# sudo sh VBoxLinuxAdditions.run --nox11
# echo "**************************************"
# echo "Done Run VBOX Additions"
# echo "**************************************"
# cd /opt
# sudo rm *.iso
# sudo /etc/init.d/vboxadd setup
# sudo chkconfig --add vboxadd
# sudo chkconfig vboxadd on
# sudo systemctl enable vboxadd.service


echo "**************************************"
echo " maven git etc. "
echo "**************************************"

apt-get install -y -q maven git eclipse  testng chromium-browser chromium-chromedriver imwheel pandoc lynx
apt install net-tools


echo "**************************************"
echo "Installing profiles"
echo "**************************************"


# Faster Scroll wheel on mouse
cp /packages/.imwheelrc /home/vagrant/

# Note to user
cp /packages/README.md /home/vagrant/ 
cp /packages/.setupUser.sh /home/vagrant/       

wget https://github.com/howlingsails/ubuntu-bash-profile/archive/master.zip
unzip master.zip
cd ubuntu-bash-profile-master
echo "---- PWD -----"
pwd
ls
echo "Copy"
cp .bash* /home/vagrant
echo "Copied"
ls /home/vagrant

# Get Rid of Window CR/LF issue
sudo sed -i 's/\r$//' /home/vagrant/.bash_aliases
sudo sed -i 's/\r$//' /home/vagrant/.bash_commands
sudo sed -i 's/\r$//' /home/vagrant/.bash_installs
sudo sed -i 's/\r$//' /home/vagrant/.bash_logout
sudo sed -i 's/\r$//' /home/vagrant/.bash_profile
sudo sed -i 's/\r$//' /home/vagrant/.bash_prompt
sudo sed -i 's/\r$//' /home/vagrant/.imwheelrc
sudo sed -i 's/\r$//' /home/vagrant/README.md

#Set Permission on user files
chown vagrant:vagrant /home/vagrant/.bash*
chown vagrant:vagrant /home/vagrant/.imwheelrc
chown vagrant:vagrant /home/vagrant/README.md
chown -R vagrant.vagrant /home/vagrant

#Set Execute on UserSetup
# chmod 700 /home/vagrant/.setupUser.sh

echo "**************************************"
echo "**************************************"
ls -altr /home/vagrant/
echo "**************************************"
echo "**************************************"



echo "**************************************"
echo " Installing terminator terminal "
echo "**************************************"
sudo apt-get -y -q install terminator

echo "**************************************"
echo "**************************************"
echo "Installing Visual Studio Code"
echo "**************************************"
echo "**************************************"

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y -q install code

echo "**************************************"
echo "**************************************"

#echo "Display Resizing?? Dynamic Kernal"
#sudo apt-get -y install dkms
#dkms autoinstall





echo "*********************************************"
echo "*********************************************"
echo " That's All Folks...."
echo "*********************************************"
echo "*********************************************"
