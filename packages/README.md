# Post Installation Setup

## App Setup

### Terminator

For terminal access to the command line I use Terminator which we need to hook up to use our .bash_profile to allow for ease of use.

1. Open Terminator from "Show Applications" (3x3 dots icon) in the lower left corner.
2. Right click in the Terminator window and select preferences
3. In preferences, select the "Profiles" tab
4. In the Profiles area, select the "Command" sub-tab
5. Select "Run command as a login shell"
6. Press Close and then close Terminator
7. Reopen Terminator and you'll have the .bash_profile loaded

### IntelliJ Communite Editions

1. Open Terminator
2. cd /opt/idea-IC-183.4588.61/bin
4. ./idea.sh



### Full Distro Upgrade after Ready.

https://askubuntu.com/questions/732409/how-to-avoid-apt-get-y-dist-upgrade-being-interactive-with-waagent

```bash
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade "
```


