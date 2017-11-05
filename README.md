# Linux Mint post-install

## Modify GRUB entries if black screen on boot

Edit ```/etc/default/grub``` file and modify GFX entry like this: ```GRUB_GFXMODE=640x480```

Then, on root: ```update-grub```

## Install all common packages

### To search for packages: 
```apt-cache search xml``` to search for all packages containing ```xml```

### Common packages
```
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install terminator
sudo apt-get install fonts-inconsolata
sudo apt-get install docky
sudo apt-get install dos2unix 
```

### Devlopment environment
```
sudo apt-get install build-essential
sudo apt-get install hexedit
```

### XML environment
```
sudo apt-get install xsltproc
sudo apt-get install libxml2-utils
```

### Latex environment
```
sudo apt-get install texlive-full
```

### Screen brightness control
```
sudo apt-get install xbacklight
```

### Install & configure zsh
```
sudo apt-get install zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```


### Other downloads

- Opera (install first libcurl3: ```sudo apt-get install libcurl3```)
- Chrome
- VSCode

## Configure settings
### Configure git

### Configure vim
- install ```vundle```
- ```wget https://raw.githubusercontent.com/dandyvica/configfiles.git/vimrc $HOME/.vimrc```
- start ```vim``` and type ```:PluginInstall```
- restart ```vim```

### Customize desktop

- install ```numix``` icons

### Misc
```
sudo apt-get install tree
```