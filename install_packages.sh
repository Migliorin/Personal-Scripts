#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Download and execute the setup script for Atuin
echo -e "${YELLOW}Starting installation of Atuin...${NC}"
/bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Atuin installation complete.${NC}"
else
    echo -e "${RED}Atuin installation failed.${NC}"
    exit 1
fi

# Update package list
echo -e "${YELLOW}Updating package list...${NC}"
sudo apt update

# Install Terminator
echo -e "${YELLOW}Installing Terminator...${NC}"
sudo apt install terminator -y
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Terminator installation complete.${NC}"
else
    echo -e "${RED}Terminator installation failed.${NC}"
    exit 1
fi

# Install tmux
echo -e "${YELLOW}Installing tmux...${NC}"
sudo apt install tmux -y
if [ $? -eq 0 ]; then
    echo -e "${GREEN}tmux installation complete.${NC}"
else
    echo -e "${RED}tmux installation failed.${NC}"
    exit 1
fi

echo -e "${GREEN}All installations are complete.${NC}"

