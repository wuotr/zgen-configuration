
# ******************************************************************************
# START OF RELEVANT SYNTAX
# ******************************************************************************

# MANUALLY SET THE ENVIRONMENT LANGUAGE ----------------------------------------
# => Needed to make the 'BULLET TRAIN' git icons work correclty!
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# ==============================================================================


# MANUALLY SET THE 'PATH' ENVIRONMENT VARIABLES --------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
# ==============================================================================


# NVM SETUP --------------------------------------------------------------------
# => This is needed on MacOS only because NVM was installed through homebrew.
# => On Linux / Windows WSL the if-statement should return 'false'.
if command -v brew >/dev/null 2>&1; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi
# ==============================================================================


# (ZSH) FIX 'DIRCOLORS' FOR GNU LS ---------------------------------------------
# => The eval-statement is meant to be executed only on Linux and in WSL on Windows10.
# => On MacOS the if-statement should return 'false'.
if ls --color -d . >/dev/null 2>&1; then
  eval `dircolors ~/.zgen/dircolors-solarized/dircolors.ansi-light`
fi
# ==============================================================================


# (ZSH) 'BULLET TRAIN' THEME ---------------------------------------------------
# => Segments
export BULLETTRAIN_CONTEXT_DEFAULT_USER=wuotr
# Default user.
# If you are running with other user other than default, the "context" segment will be shown.

export BULLETTRAIN_TIME_SHOW=true
export BULLETTRAIN_CONTEXT_SHOW=false
export BULLETTRAIN_VIRTUALENV_SHOW=false
export BULLETTRAIN_RVM_SHOW=false
export BULLETTRAIN_NVM_SHOW=true

export BULLETTRAIN_DIR_EXTENDED=1
# Extended path (0=short path, 1=medium path, 2=complete path, everything else=medium path).

# => Colors
export BULLETTRAIN_TIME_BG=6
export BULLETTRAIN_TIME_FG=0
export BULLETTRAIN_STATUS_ERROR_BG=1
export BULLETTRAIN_STATUS_FG=0
export BULLETTRAIN_DIR_BG=8
export BULLETTRAIN_DIR_FG=0
export BULLETTRAIN_NVM_BG=10
export BULLETTRAIN_NVM_FG=0
export BULLETTRAIN_GIT_BG=11
export BULLETTRAIN_GIT_COLORIZE_DIRTY=true
export BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=3
export BULLETTRAIN_EXEC_TIME_BG=13

# => Icons
export BULLETTRAIN_GIT_DIRTY=" !"
export BULLETTRAIN_GIT_CLEAN=""
export BULLETTRAIN_GIT_ADDED=" +"
export BULLETTRAIN_GIT_MODIFIED=" *"
export BULLETTRAIN_GIT_DELETED=" X"
export BULLETTRAIN_GIT_UNTRACKED=" ?"
export BULLETTRAIN_NVM_PREFIX=""
# ==============================================================================


# (ZSH) HISTORY-SUBSTRING-SEARCH CUSTOMISATION ---------------------------------
setopt HIST_IGNORE_ALL_DUPS
# ==============================================================================


# ZGEN SETUP -------------------------------------------------------------------
# => Load the zgen script.
source "${HOME}/.zgen/zgen/zgen.zsh"

# Check if there's no init script.
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/wd
    zgen load lukechilds/zsh-nvm
    # zgen oh-my-zsh plugins/npm
    # zgen oh-my-zsh plugins/docker
    # zgen oh-my-zsh plugins/docker-compose
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # save all to init script
    zgen save
fi

# => "zsh-history-substring-search" plugin
# => Key bindings (for UP and DOWN arrow keys).
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# ==============================================================================

# ******************************************************************************
# END OF RELEVANT SYNTAX
# ******************************************************************************



# OLD SYNTAX KEPT FOR FUTURE REFERENCE -----------------------------------------

# => Fix for KITTY terminal emulator
# => Key bindings (for ALT / SHIFT + LEFT / RIGHT ARROW keys)
# INFO: 'terminfo' could not be used easily with KITTY --> https://invisible-island.net/ncurses/terminfo.src.html#tic-xterm_pcfkeys
# bindkey "^[[1;3C" forward-word
# bindkey "^[[1;3D" backward-word
# bindkey "^[[1;2C" end-of-line
# bindkey "^[[1;2D" beginning-of-line

# ==============================================================================
