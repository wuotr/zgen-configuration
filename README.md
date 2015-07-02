# zgen-configuration
This repo contains my personal [zgen](https://github.com/tarjoilija/zgen) configuration (that may be used to get up and running quickly).

## Installation
1. Clone the repo on your machine:
````
git clone --recursive git@github.com:wuotr/zgen-configuration.git ~/.zgen
````
(I use a ```.zgen``` folder in my homedir, but you can use any location you want really.)

2. Create a symlink to the ```.zshrc``` file in the ```.zgen``` folder:
````
ln -s .zgen/.zshrc .zshrc
````

3. Change your shell to zsh:
````
chsh -s /bin/zsh
````
Or if you installed zsh via [Homebrew](http://brew.sh) (which I really recommend since the brew verson is more recent than the one shipped with OSX):
````
chsh -s /usr/local/bin/zsh
````
(Please make sure the ```/usr/local/bin/zsh``` path is added to your ```/etc/shells``` file. Otherwise OSX will start complaining.)

That's it... Now zgen should generate its ```init.zsh``` file and get you up and running. If you want to verify the correct zsh installation is used (in case of the [Homebrew](http://brew.sh) version for example), you can execute this command to print the path to the current zsh executable:
````
echo $SHELL
````

## Notes
- Remember to run ```zgen update``` after making changes to your ```.zshrc``` file (if you want to add plugins / themes for example).
- You may need to edit the ```PATH``` environment variable towards your setup.
- If you create a ```~/.zshrc.local``` file in your homedir, it's content (scripts) will be loaded as well. So you don't have to touch the ```.zshrc``` file per sé.
- My theme ([Bullet Train](https://github.com/caiogondim/bullet-train-oh-my-zsh-theme)) needs a "Powerline enabled font" to run as intended. If you use it without, no arrows / git icons will be shown. Some of the available fonts can be found [in this repo](https://github.com/powerline/fonts).

## Other useful links
- [unixorn/awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) (A repo full of links to cool zsh stuff.)
- [tarjoilija/zgen](https://github.com/tarjoilija/zgen) (The zgen repo.)
- [robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) (The oh-my-zsh repo.)
- [zsh-users/antigen](https://github.com/zsh-users/antigen) (The antigen repo, to which zgen is inspired.)
- [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) (A veru nice zsh plugin for syntax highlighting.)
- [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) (An even nicer plugin to make searching your command history a breeze.)

If you use the ```zsh-history-substring-search``` plugin, you need to add this little script after the zgen configuration (or in your ```zshrc.local``` file if you have one) to make the arrow keys work:
````
# (Zsh) "zsh-history-substring-search" plugin
# -----------------------------------------------------
# => Key bindings (for UP and DOWN arrow keys)
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
````
