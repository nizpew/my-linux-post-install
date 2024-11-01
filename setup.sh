#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt update && sudo apt upgrade -y

# Install essential packages via apt
echo "Installing essential packages..."
sudo apt install -y \
    bash coreutils sudo apt dpkg man-db findutils grep curl wget \
    build-essential git vim gcc g++ make cmake python3 python3-pip \
    nodejs npm gnome-shell gnome-terminal nautilus xorg mesa-utils \
    vlc ffmpeg gimp audacity mpv software-properties-common unattended-upgrades \
    network-manager openssh-client net-tools iptables htop tmux rsync zip unzip tar zsh snapd flatpak \
    i3 i3status i3lock dmenu feh rofi compton xinit xorg ranger

# Install clipboard via snap
echo "Installing clipboard via snap..."
sudo snap install clipboard

# Function to check and install dependencies
check_dependencies() {
    local dependencies=("gjs" "curl" "rofi" "fzf" "mpv" "ffmpeg" "aria2" "xdotool" "eza")
    local missing=()

    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing+=("$dep")
        fi
    done

    if [ ${#missing[@]} -ne 0 ]; then
        echo "The following dependencies are missing: ${missing[*]}"
        echo "Installing dependencies..."
        
        # Install missing dependencies using apt
        sudo apt update
        sudo apt install -y "${missing[@]}"
    else
        echo "All dependencies are installed."
    fi

    # Install NVM if not installed
    if [ ! -d "$HOME/.nvm" ]; then
        echo "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
    else
        echo "NVM is already installed."
    fi

    # Install st from GitHub
    if [ ! -d "$HOME/st" ]; then
        echo "Cloning st from GitHub..."
        git clone https://github.com/mrdotx/st.git "$HOME/st"
        cd "$HOME/st" || exit
        echo "Building and installing st..."
        make clean install
        cd ..
        echo "st has been installed successfully."
    else
        echo "st is already installed."
    fi

    # Final message
    echo "All installations and configurations are complete."
}

# Call the function to check dependencies
check_dependencies

# Copy configuration files
echo "Copying configuration files from the repository to ~/.config..."
cp -r ./my-linux-post-install/.config/* ~/.config
echo "Copying .zshrc to the user's home directory..."
cp ./my-linux-post-install/.zshrc ~/

# Move .bashrc to the user's home directory
echo "Copying .bashrc to the user's home directory..."
cp ./my-linux-post-install/.bashrc ~/

# Final message
echo "Configuration files have been copied successfully."
echo "Setup completed. Please restart your terminal to apply changes."

# Update the package list
sudo apt update

# Install essential dependencies
sudo apt install -y \
    i3 \
    i3lock \
    i3status \
    dmenu \
    rofi \
    feh \
    picom \
    brightnessctl \
    xss-lock \
    nm-applet \
    pulseaudio \
    pulseaudio-utils \
    xbacklight \
    flameshot \
    chromium \
    dunst \
    xautolock \
    playerctl \
    xkbset \
    git \
    build-essential

# Install i3blocks if you are using it
sudo apt install -y i3blocks

# Install st (if not already installed)
if [ ! -d "$HOME/st" ]; then
    echo "Cloning st from GitHub..."
    git clone https://github.com/mrdotx/st.git "$HOME/st"
    cd "$HOME/st" || exit
    echo "Building and installing st..."
    make clean install
    cd ..
else
    echo "st is already installed."
fi

echo "All dependencies have been installed successfully."

# Moving to home directory
cd

# Copying files to /usr/local/bin with sudo
sudo cp -r ./my-linux-post-install/usr/local/bin/* /usr/local/bin/ 
sudo chmod +x /usr/local/bin/*

# Creating a directory for wallpapers
mkdir ~/Downloads/wallpapers/

# Copying image to the wallpapers directory
cp ./my-linux-post-install/purplecyb.jpg ~/Downloads/wallpapers/

echo "Copying .zshrc to the user's home directory..."
echo '(Press Y and enter when prompted about zsh, then type "exit" and hit enter to leave zsh)'
sleep 2
# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Install Powerlevel10k if not installed
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
else
    echo "Powerlevel10k is already installed."
fi

# Install zsh-autosuggestions if not installed
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting if not installed
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Install pokemon-colorscripts if not installed
if ! command -v pokemon-colorscripts &> /dev/null; then
    echo "Installing pokemon-colorscripts..."
    sudo apt install -y python3-pip
    git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
    cd pokemon-colorscripts
    sudo ./install.sh
    cd
else
    echo "pokemon-colorscripts is already installed."
fi
