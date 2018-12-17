# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "jvautier/ubuntu-18.04-desktop"
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.name = "dev_ubuntu_box"
    vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.cpus = 4
#    vb.customize "pre-boot", [
#       "storageattach", :id,
#       "--storagectl", "IDE",
#       "--port", "1",
#       "--device", "0",
#       "--type", "dvddrive",
#       "--medium", "emptydrive",
#     ]
     vb.customize ["modifyvm", :id, "--clipboard",   "bidirectional"]
     vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
     #https://stackoverflow.com/questions/24231620/how-to-set-vagrant-virtualbox-video-memory
     vb.customize ["modifyvm", :id, "--vram", "64"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "on"]	
     vb.customize ["modifyvm", :id, "--accelerate2dvideo", "off"]	
     #vb.customize ["modifyvm", :id, "--monitorcount ", "2"]
     vb.customize ["modifyvm", :id, "--name", "howling-sails-dev"]
    end
  
   #https://www.vagrantup.com/docs/synced-folders/basic_usage.html
   config.vm.synced_folder "packages/", "/packages", type: "rsync"

   #https://www.vagrantup.com/docs/networking/public_network.html
   config.vm.network "public_network",  use_dhcp_assigned_default_route: true, bridge: "en0: Wi-Fi (AirPort)"
  
  config.vm.provision "shell", inline: <<-SHELL

        
        echo "**************************************"
        echo " apt-get Update"
        echo "**************************************"
        apt-get install python git
        git clone https://github.com/jblakeman/apt-select
        python apt-select/setup.py install
        apt-select --country US -t 5 --choose --min-status one-week-behind
        #sudo sed -i -e 's%http://archive.ubuntu.com/ubuntu%mirror://mirrors.ubuntu.com/mirrors.txt%' -e 's/^deb-src/#deb-src/' /etc/apt/sources.list
        #update repo info
        apt-get update
        
        #ensure non-interactive updates
        export DEBIAN_FRONTEND=noninteractive 

        #echo "**************************************"
        #echo " virtualbox-guest-dkms"
        #echo "**************************************"

        #sudo apt-get -y install virtualbox-guest-dkms
        #sudo apt-get -y install linux-headers-virtual  

        echo "**************************************"
        echo " VBoxGuestAdditions"
        echo "**************************************"

      #Install VBox Additions
      cd /opt
      sudo wget --quiet -c https://download.virtualbox.org/virtualbox/5.2.6/VBoxGuestAdditions_5.2.22.iso -O VBoxGuestAdditions_5.2.22.iso
      sudo mount VBoxGuestAdditions_5.2.22.iso -o loop /mnt
      sudo mount VBoxGuestAdditions_5.2.22.iso -o loop /vboxsf
      
      cd /mnt
      echo "Tool mnt directory"
      ls /mnt
      echo "Trying to install guest additions"
      sudo sh VBoxLinuxAdditions.run --nox11
      echo "Done Run VBOX Additions"
      cd /opt
      sudo rm *.iso
      sudo /etc/init.d/vboxadd setup
      sudo chkconfig --add vboxadd
      sudo chkconfig vboxadd on
      sudo systemctl enable vboxadd.service

      #https://askubuntu.com/questions/732409/how-to-avoid-apt-get-y-dist-upgrade-being-interactive-with-waagent
      echo "**************************************"
      echo " apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade "
      echo "**************************************"


      
      
      #install Dev Software
      #apt-get install -y javacc
      echo "**************************************"
      echo "  Java "
      echo "**************************************"
      
      #java8
      add-apt-repository -y ppa:webupd8team/java
      apt update
      
      #java8 ensure non-interactive
      
      echo "Uncomment for Installing Oracle Java 8 Non-Interactive. Please look at the license and agree before uncommenting"

      #echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
      #echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections	
      #apt install -y oracle-java8-installer

      
      echo "**************************************"
      echo " maven git etc. "
      echo "**************************************"

        apt-get install -y maven git git-flow git-cola meld subversion eclipse eclipse-egit testng chromium-browser chromium-chromedriver ant docker mc joe
        
      #HOME
      cd /home/vagrant
      echo "**************************************"
      echo " Intellij  "
      echo "**************************************"
      
      sudo wget -q https://download.jetbrains.com/idea/ideaIC-2018.3.1.tar.gz 
      sudo tar xf ideaIC-2018.3.1.tar.gz -C /opt

      echo "**************************************"
      echo "Installing profiles"
      echo "**************************************"
        
      cp /packages/.bash* /home/vagrant/
      chown vagrant:vagrant .bash*

      cp /packages/README.md /home/vagrant/        
      chown -R vagrant.vagrant /home/vagrant
        
      echo "**************************************"
      echo " Installing terminator terminal "
      echo "**************************************"
      sudo apt-get -y install terminator
      
      echo "**************************************"
      echo "**************************************"
      echo "Installing Visual Studio Code"
      echo "**************************************"
      echo "**************************************"
      
      wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
      sudo apt -y install code

      echo "**************************************"
      echo "**************************************"
      
      #echo "Display Resizing?? Dynamic Kernal"
      #sudo apt-get -y install dkms
      #dkms autoinstall
      
      # Generate SSH Key #TODO Change the password from vagrant on the -N option
      ssh-keygen -t rsa -b 8198 -C "dev-ubuntu-box" -N "vagrant" -f ~/.ssh/id_rsa 
      eval $(ssh-agent -s)
      echo "vagrant" | ssh-add ~/.ssh/id_rsa

      sshPubKey=`cat ~/.ssh/id_rsa.pub`

      # Create my default development file location      
      mkdir ~/dev

      echo "*********************************************"
      echo "*********************************************"
      echo " That's All Folks...."
      echo "*********************************************"
      echo "*********************************************"
      reboot
  SHELL

end
