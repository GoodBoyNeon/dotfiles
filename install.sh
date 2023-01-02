#!/bin/bash

clear

function gitInstallCheck() {
  command -v git >/dev/null 2>&1 ||
  { echo >&2 "Git is not installed. Installing..";
    sudo pacman -S git
  };
}

# function replaceConfig() {
#   rsync --exclude ".git/" \
#     --exclude "images/" \
#     --exclude "README.md" \
#     --exclude "LICENSE" \
#     -avh --no-perms . ~;
# }

function setupNvim() {
  echo "Now setting up Neovim..."
  echo "The following step would open nvim and start synchronizing packages. After syncing packages, exit neovim with :q command"

  read -p "Press enter to continue. " REPLY;
  REPLY=${REPLY:-continue}
  echo "";

  if [[ $REPLY =~ continue ]]; then
    nvim +"PackerSync"
  fi
}

function setup() {
  gitInstallCheck;

  echo "Installing the dependencies..."

  echo ""

  read -p "Which AUR helper do you want to use? (1 = yay | 2 = paru): " REPLY
  if [[ $REPLY =~ 1 ]]; then
    AUR="yay"
  elif [[ $REPLY =~ 2 ]]; then
    AUR="paru"
    else
      echo "Invalid option!"
  fi
  
  # rsync will be used to copy the config files
  sudo pacman -S rsync
  sudo pacman -S alacritty bat btop fish neofetch neovim polybar tmux
  $AUR -S awesome-git cava picom-pijulius-git

  echo "Finished installing dependencies!";
  echo "";

  echo "Clong the repository..."
  git clone https://github.com/GoodBoyNeon/dotfiles.git
  
  echo "The next step will replace your current configuration files with new one. Make sure you have backups if you need your current config later."
  read -p "Continue? (Y/n)" REPLY
  REPLY=${REPLY:-y}
  echo "";

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # replace_config;
    echo "test"
  fi

  setupNvim;
}

echo "-- WELCOME TO THE SETUP WIZARD --";
echo "WARNING: Only continue if you meet the following requirements:";
echo "";
echo "1. Have an yay or paru (AUR helper) installed";
echo "2. Have backed up your current configuration";
echo "";
read -p "Do you meet the requirements? (Y/n): " REPLY;
REPLY=${REPLY:-y}
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
  setup;
fi
