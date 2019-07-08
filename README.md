# vagrant-dev-ubuntu-18-04

A Vagrant configuration for getting a Ubuntu 18.04 UI desktop running in VirtualBox.

## Directions

1. Install Virtual Box [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
2. Install Vagrant [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)
3. Start Virtual Box
4. Open a command prompt (windows) / terminal (mac)
5. Install git [https://git-scm.com/book/en/v2/Getting-Started-Installing-Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
6. Clone this repo
7. Switch into this directory
8. Linux/Mac terminal run `vagrant up --debug &> vagrant.log` 
9. Windows Powershell  `vagrant up --debug 2>&1 | Tee-Object -FilePath ".\vagrant.log"`
10. Watch vagrant run. This will take a long time as it downloads and creates a full development box.
11. Grap coffee and watch another Howling Sails vblogs :-)
12. One Completed you'll see "That's All Folks" message in the terminal.
13. Now switch to Virtual Box and login, User:vagrant Password: vagrant
14. Login
15. Open README.md on the box for following steps.