# Steps after Linux Mint install

## Modify GRUB entries

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
```

### Devlopment environment
```
sudo apt-get install build-essential
```

### XML environment
```
sudo apt-get install xsltproc
```

### Latex environment
```
sudo apt-get install xsltproc
```

### Configure git account settings

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
### Configure vim
- install ```vundle```
- ```wget https://raw.githubusercontent.com/dandyvica/configfiles.git/vimrc $HOME/.vimrc```
- start ```vim``` and type ```:PluginInstall```
- restart ```vim```
