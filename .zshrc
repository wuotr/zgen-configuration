
# Manually set your environment language
export LANG=en_US.UTF-8

# Manually set your 'PATH' environment variable
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Make it easy to add your own customizations without having to modify this file too much
# Note: The file is sourced before loading zgen so one could set variables that might be used by plugins / themes properly
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Load zgen
source "${HOME}/.zgen/zgen/zgen.zsh"

# Check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/wd
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load wuotr/qfc

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # save all to init script
    zgen save
fi

# CUSTOM:
# ===============================================================================================

# "zsh-history-substring-search" plugin
# -----------------------------------------------------------------------------------------------
# => Key bindings (for UP and DOWN arrow keys)
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# "qfc" completion
# -----------------------------------------------------------------------------------------------
# => Load the script manually here since it's not recognized as zsh plugin automatically
source "${HOME}/.zgen/wuotr/qfc-master/bin/qfc.sh"
