# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Source configuration files from .shells directory

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"

plugins=( 
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts -n mimikyu
/home/$USER/set-wallpaper.sh &>> /dev/null
##neofetch --ascii_distro Arch_small

# Set-up icons for files/folders in terminal using eza
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
