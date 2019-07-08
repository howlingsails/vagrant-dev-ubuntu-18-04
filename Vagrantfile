#########################################################################################
#########################################################################################
#  Smooth Seas might not make great sails, but great sailor know how to make it easy..  #
#      -- Cap10bill
#########################################################################################
#########################################################################################



# Vagramt Example build into working isolated development box

# TODO What in the heck is the "2" mean?
Vagrant.configure("2") do |config|
  
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  
  config.vm.box = "jvautier/ubuntu-18.04-desktop"  # Wish I could find this "Vagrant" file. basic Ubuntu 18.04 with Gkone (I think). I liked Aero in 16.04 development but time to move forware. Thanks jvautier..
  
  
  config.vm.hostname = "howlingstails"  # My Machine Name
  config.vm.provider "virtualbox" do |vb|  # Virtual Box Configuration Section (I think you can switch to VMWARE)
    # Display the VirtualBox GUI when booting the machine
    vb.name = "dev_ubuntu_box"

    vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
    vb.cpus = 4
    vb.customize "pre-boot", [
      # Sometimes need to change these for upgraded machines, in in VirtualBox Config for what works manually
       "storageattach", :id,
       "--storagectl", "IDE Controller",
       "--port", "1",
       "--device", "0",
       "--type", "dvddrive",  
       "--medium", "emptydrive",
     ]
     vb.customize ["modifyvm", :id, "--clipboard",   "bidirectional"] # This is touchy, but can work well (at least it did in 16.04)
     vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"] # Never really tried this
     #https://stackoverflow.com/questions/24231620/how-to-set-vagrant-virtualbox-video-memory
     vb.customize ["modifyvm", :id, "--vram", "128"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "off"]	
     vb.customize ["modifyvm", :id, "--accelerate2dvideo", "off"]	
     #vb.customize ["modifyvm", :id, "--monitorcount ", "2"]
     vb.customize ["modifyvm", :id, "--name", "howling-sails-dev-" + Time.now.strftime("%Y%m%d%H%M")]
    end
  
   #https://www.vagrantup.com/docs/synced-folders/basic_usage.html
   config.vm.synced_folder "packages/", "/packages", type: "rsync"

   #https://www.vagrantup.com/docs/networking/public_network.html
   config.vm.network "public_network",  use_dhcp_assigned_default_route: true, bridge: "en0: Wi-Fi (AirPort)"
  
   # Basically run bash scripts for most of the common stuff to install. Check the .bash_profile --> .bash_system, .bash_command, .bash_installs interaction with interactive shell (.bash_profile loaded in terminal)
  config.vm.provision "shell", inline: <<-SHELL

        #ensure non-interactive updates
        export DEBIAN_FRONTEND=noninteractive 

        
        echo "****************************************"
        echo " Howling Sails Development Ubuntu 18.04"
        echo "****************************************"
  
        
        echo "**************************************"
        echo "**************************************"
        echo "COPY sources.list"
        cp /packages/sources.list /etc/apt/sources.list
        echo "**************************************"
        echo "**************************************"

        echo "**************************************"
        echo " apt-get Update"
        echo "**************************************"

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
        apt-get -y -q update
        

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
      sudo wget --quiet -c https://download.virtualbox.org/virtualbox/6.0.6/VBoxGuestAdditions_6.0.6.iso -O VBoxGuestAdditions_6.0.6.iso
      sudo mount VBoxGuestAdditions_6.0.6.iso -o loop /mnt
      sudo mount VBoxGuestAdditions_6.0.6.iso -o loop /vboxsf
      
      cd /mnt
      echo "**************************************"
      echo "Tool mnt directory"
      echo "**************************************"
      ls /mnt
      echo "**************************************"
      echo "Trying to install guest additions"
      echo "**************************************"
      sudo sh VBoxLinuxAdditions.run --nox11
      echo "**************************************"
      echo "Done Run VBOX Additions"
      echo "**************************************"
      cd /opt
      sudo rm *.iso
      sudo /etc/init.d/vboxadd setup
      sudo chkconfig --add vboxadd
      sudo chkconfig vboxadd on
      sudo systemctl enable vboxadd.service


      echo "**************************************"
      echo " maven git etc. "
      echo "**************************************"

        apt-get install -y -q maven git eclipse  testng chromium-browser chromium-chromedriver imwheel
        apt-get install -y -q pandoc lynx 


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
      chmod 700 /home/vagrant/.setupUser.sh

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
      reboot
  SHELL

end
