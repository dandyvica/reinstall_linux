# Steps after Linx Mint install

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

```
### Configure git account settings

### Install & configure zsh

### Other downloads

- Opera
- Chrome
