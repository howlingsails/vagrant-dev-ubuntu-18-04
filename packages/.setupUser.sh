# Create my default development file location      
echo "******************************"
echo "Create Default dev directory"
echo "******************************"

mkdir ~/dev

#SSH Stuff
echo "******************************"
echo "SSH Stuff"
echo "******************************"
ssh-keygen -t rsa -b 8196 -C "vag-dev-vm-$HOSTNAME" -N "vagrant" -f ~/.ssh/id_rsa 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa    



echo "******************************"
echo "Public Key"
echo "******************************"
cat ~/.ssh/id_rsa.pub
echo "******************************"


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

echo "******************************"
echo "Stuff that you added"
echo "******************************"

#sudo apt update
#sudo apt install nodejs
#sudo apt install npm


#https://github.com/nodesource/distributions/blob/master/README.md#debinstall
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

