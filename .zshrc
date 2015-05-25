
# load zgen
source "${HOME}/.zgen/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    # zgen oh-my-zsh plugins/sudo
    # zgen oh-my-zsh plugins/command-not-found
    # zgen load zsh-users/zsh-syntax-highlighting
    # zgen load /path/to/super-secret-private-plugin

    # completions
    # zgen load zsh-users/zsh-completions src

    # theme
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # save all to init script
    zgen save
fi

# Make it easy to append your own customizations without having to modify this file too much
if [ -f ~/.zshrc.local ]; then
  source .zshrc.local
fi