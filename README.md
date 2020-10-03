# Linux Mint Cinnamon/Ubuntu Gnome edition post-install

## Modify GRUB entries if black screen on boot (might not be necessary anymore)

Edit ```/etc/default/grub``` file and modify GFX entry like this: ```GRUB_GFXMODE=640x480```

Then, on root: ```update-grub```

No more necessary on Mint 19.0

## Install all common packages

### To search for packages: 
```apt-cache search xml``` to search for all packages containing ```xml```

### Common packages
```
sudo apt-get install terminator
sudo apt-get install fonts-inconsolata
sudo apt-get install docky
sudo apt-get install dos2unix 
```

### Development environment
```
sudo apt-get install build-essential
sudo apt-get install hexedit
sudo apt install hexyl
```

### Install and configure ```vim```
```sh
# install vim
sudo apt-get install vim

# create .vim
mkdir ~/.vim

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install personal .vim settings
wget https://raw.githubusercontent.com/dandyvica/reinstall_linux/master/vimrc -O ~/.vimrc

```
and start ```vim``` and type ```:PluginInstall```

### git environment
```sh
# install git
sudo apt-get install git

# configure settings
git config --global user.email "Vous@exemple.com"
git config --global user.name "Votre Nom"
```

### XML environment
```
sudo apt-get install xsltproc
sudo apt-get install libxml2-utils
```

### Android environment
```
sudo apt-get install adb fastboot
```

### Latex environment
```
sudo apt-get install texlive-full
```

### Screen brightness control
```
sudo apt-get install xbacklight
```

### Install & configure zsh with ```Oh my zsh```
```sh
sudo apt-get install zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

Optionnaly, edit the ```.zshrc``` file and change the theme.


### Other downloads

- Opera (install first libcurl3: ```sudo apt-get install libcurl3```)
- Chrome
- VSCode

## Configure settings


### Configure vim


### Customize desktop

- install ```numix``` icons

### Misc
```
sudo apt-get install tree
```

## Eye-candy
```sh
sudo apt-get install gnome-tweak-tool 
sudo apt-get install gnome-shell-extensions
```

### Install themes
Copy downloaded zip pacakge into ```.themes``` and ```.icons``` directories.

# Linux workstation hardening

## Browsers

* add ```startpage``` and ```duckduckgo``` search engines instead of Google.

## Firefox

* enable ```AppArmor``` profile for Firefox: 

```sh
# install utilities
sudo apt-get install apparmor-utils

# check if apparmor is enabled
sudo aa-status

# check if profile is available
ls /etc/apparmor.d/usr.bin.firefox

# enable profile
sudo aa-enforce /etc/apparmor.d/usr.bin.firefox

# check success
sudo aa-status | grep firefox

# if any, to restart apparmor:
sudo apt-get install apparmor-utils
```

* install extensions(https://vikingvpn.com/cybersecurity-wiki/browser-security/guide-hardening-mozilla-firefox-for-privacy-and-security)

- uBlock Origin
- 



## firewall using ```iptables```

Check video here: https://www.youtube.com/watch?v=D7LgjSOWCxg among other resources.

Create this file ```iptables.rules```:

```sh
# load firewall config with iptables-restore < iptables.rules

*filter

# set default DROP policy
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# accept any related or established connection
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# allow all traffic on the loopback interface
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# allow outbound DHCP requests
-A OUTPUT -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# allow outbound DNS lookups
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT

# allow outbound ping requests
-A OUTPUT -p icmp -j ACCEPT

# allow outbound NTP requests
-A OUTPUT -p udp --dport 123 --sport 123 -j ACCEPT

# allow outbound http/https requests
-A OUTPUT -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT

# commit changes
COMMIT
```

then apply: 
```sh
# apply rules
sudo iptables-restore <iptables.rules

# check
sudo iptables -L

# install iptables-persistent package to load rules at boot
sudo apt-get install iptables-persistent
```



## Opera

# Configure ```kvm``` for type 1 virtualization

* check wheter CPU supports virtualization:
```sh
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
```

* install kvm/qemu:
```sh
sudo apt-get install qemu-kvm
```

* run a LiveCD in a VM with 2GB of RAM:
```sh
sudo kvm -m 2048 -cdrom livecd.iso
```
