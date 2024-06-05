#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}


# Check and install Terminator
if command_exists atuin; then
    echo -e "${GREEN}Atuin is already installed.${NC}"
else
    echo -e "${YELLOW}Installing Atuin...${NC}"
    sudo apt update

    /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Atuin installation complete.${NC}"
    else
        echo -e "${RED}Atuin installation failed.${NC}"
        exit 1
    fi

fi

# Check and install Terminator
if command_exists terminator; then
    echo -e "${GREEN}Terminator is already installed.${NC}"
else
    echo -e "${YELLOW}Installing Terminator...${NC}"
    sudo apt update

    sudo apt install terminator -y
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Terminator installation complete.${NC}"
    else
        echo -e "${RED}Terminator installation failed.${NC}"
        exit 1
    fi
fi

# Check and install Glow
if command_exists glow; then
    echo -e "${GREEN}Glow is already installed.${NC}"
else
    echo -e "${YELLOW}Installing Glow...${NC}"
    
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    
    # Update package list
    echo -e "${YELLOW}Updating package list...${NC}"
    sudo apt update
    
    sudo apt install glow -y
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Glow installation complete.${NC}"
    else
        echo -e "${RED}Glow installation failed.${NC}"
        exit 1
    fi
fi

# Check and install tmux
if command_exists tmux; then
    echo -e "${GREEN}tmux is already installed.${NC}"
else
    echo -e "${YELLOW}Installing tmux...${NC}"
    sudo apt install tmux -y
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}tmux installation complete.${NC}"
    else
        echo -e "${RED}tmux installation failed.${NC}"
        exit 1
    fi
fi

# Check and install Docker
if command_exists docker; then
    echo -e "${GREEN}Docker is already installed.${NC}"
else
    echo -e "${YELLOW}Installing Docker...${NC}"
    
    # Remove old versions
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do 
	sudo apt-get remove $pkg; 
    done
        
    # Set up the repository
    sudo apt update
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    
    # Add the repository to Apt sources:
    echo \
  	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt update
    sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        
    sudo groupadd docker
    sudo usermod -aG docker $USER
    
    newgrp docker
    docker run hello-world

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Docker installation complete.${NC}"
    else
        echo -e "${RED}Docker installation failed.${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}All installations are complete.${NC}"

