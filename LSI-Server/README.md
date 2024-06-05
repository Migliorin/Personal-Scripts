<!-- vim-markdown-toc GitLab -->

* [VPN and SSH Management Scripts Documentation](#vpn-and-ssh-management-scripts-documentation)
* [1. Script 1: VPN Connection Management](#1-script-1-vpn-connection-management)
	* [1.1 Overview](#11-overview)
	* [1.2 Usage](#12-usage)
	* [1.3 Notes](#13-notes)
* [2. Script 2: SSH Management Script](#2-script-2-ssh-management-script)
	* [2.1 Overview](#21-overview)
	* [2.2 Usage](#22-usage)
	* [2.3 Notes](#23-notes)

<!-- vim-markdown-toc -->

# VPN and SSH Management Scripts Documentation

This markdown file provides an explanation of two Bash scripts designed to manage VPN connections and perform various SSH-related tasks.

# 1. Script 1: VPN Connection Management

## 1.1 Overview

This script is used to connect to and disconnect from a VPN using `openvpn3`. It takes a single argument to specify the action: either `--connect` or `--disconnect`.

## 1.2 Usage

To use this script, run it with either `--connect` or `--disconnect` as an argument:

- **Connect to the VPN:**
  ```bash
  ./connect_vpn.sh --connect
  ```

- **Disconnect from the VPN:**
  ```bash
  ./connect_vpn.sh --disconnect
  ```

## 1.3 Notes

- The script expects the VPN configuration file to be located at `$HOME/.local/share/openvpn/openVPNest.ovpn`.
- Ensure `openvpn3` is installed and available in the system's PATH.

# 2. Script 2: SSH Management Script

## 2.1 Overview

This script provides multiple functionalities for managing SSH connections, including connecting to a server, creating an SSH bridge, and copying files to the server. It uses color-coded messages for better readability.

## 2.2 Usage

The script supports multiple options to perform different tasks. Ensure you have set the `USER`, `IP_SERVER`, and `GATE` variables before running the script.

- **Show Help:**
  ```bash
  ./lsi_commands.sh -h
  ```
  or
  ```bash
  ./lsi_commands.sh --help
  ```

- **SSH into the Server:**
  ```bash
  ./lsi_commands.sh -t
  ```
  or
  ```bash
  ./lsi_commands.sh --terminal
  ```

- **Create SSH Bridge:**
  ```bash
  ./lsi_commands.sh --bridge SERVER_PORT LOCAL_PORT
  ```
  Replace `SERVER_PORT` and `LOCAL_PORT` with the appropriate port numbers.

- **Copy File to Server:**
  ```bash
  ./lsi_commands.sh -c SRC DEST
  ```
  or
  ```bash
  ./lsi_commands.sh --copy SRC DEST
  ```
  Replace `SRC` with the source file path and `DEST` with the destination path on the server.

## 2.3 Notes

- The `USER`, `IP_SERVER`, and `GATE` variables must be set for the script to function properly.
- Ensure the `ssh` and `scp` commands are installed and available in the system's PATH.

