# DevOpsFetch

DevOpsFetch is a tool designed for DevOps professionals to collect and display system information, including active ports, Docker images, Nginx configurations, and user logins. It also includes a systemd service for continuous monitoring and logging.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Testing](#testing)
- [Systemd Service Setup](#systemd-service-setup)
- [Troubleshooting](#troubleshooting)

## Features

- **Ports**: Display all active ports and services or details about specific ports.
- **Docker**: List Docker images and containers or details about specific containers.
- **Nginx**: Show Nginx domains and their ports or details about specific domains.
- **Users**: List users and their last login times or details about specific users.
- **Time Range**: Display activities within a specified time range.
- **Continuous Monitoring**: Automatically logs activities with log rotation.

## Installation

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your_username/devopsfetch.git
    cd devopsfetch
    ```

2. **Ensure Script Permissions**

    Make the main script executable:

    ```bash
    chmod +x ~/devopsfetch/devopsfetch.sh
    ```

3. **Ensure Required Scripts Are Executable**

    ```bash
    chmod +x ~/devopsfetch/scripts/fetch_ports.sh
    chmod +x ~/devopsfetch/scripts/fetch_docker.sh
    chmod +x ~/devopsfetch/scripts/fetch_nginx.sh
    chmod +x ~/devopsfetch/scripts/fetch_users.sh
    chmod +x ~/devopsfetch/scripts/fetch_logs.sh
    ```

## Configuration

### Systemd Service Setup

1. **Create Systemd Service File**

    Create the file `/etc/systemd/system/devopsfetch.service` with the following content:

    ```ini
    [Unit]
    Description=DevOps Fetch Service
    After=network.target

    [Service]
    ExecStart=/home/your_username/devopsfetch/devopsfetch.sh -p
    Restart=always
    User=your_username
    Group=your_group
    StandardOutput=journal
    StandardError=journal
    Environment=PYTHONUNBUFFERED=1

    [Install]
    WantedBy=multi-user.target
    ```

    Replace `/home/your_username/devopsfetch` with the path to your `devopsfetch` installation directory.

2. **Reload Systemd Daemon and Start Service**

    ```bash
    sudo systemctl daemon-reload
    sudo systemctl start devopsfetch
    sudo systemctl enable devopsfetch
    ```

3. **Check Service Status**

    ```bash
    sudo systemctl status devopsfetch
    ```

## Usage

Run the `devopsfetch` script with various options to retrieve system information:

- **List Active Ports**

    ```bash
    ~/devopsfetch/devopsfetch.sh -p
    ```

- **Details About a Specific Port**

    ```bash
    ~/devopsfetch/devopsfetch.sh -p <port_number>
    ```

- **List Docker Images and Containers**

    ```bash
    ~/devopsfetch/devopsfetch.sh -d
    ```

- **Details About a Specific Docker Container**

    ```bash
    ~/devopsfetch/devopsfetch.sh -d <container_name>
    ```

- **Display Nginx Domains and Their Ports**

    ```bash
    ~/devopsfetch/devopsfetch.sh -n
    ```

- **Details About a Specific Nginx Domain**

    ```bash
    ~/devopsfetch/devopsfetch.sh -n <domain>
    ```

- **List Users and Their Last Login Times**

    ```bash
    ~/devopsfetch/devopsfetch.sh -u
    ```

- **Details About a Specific User**

    ```bash
    ~/devopsfetch/devopsfetch.sh -u <username>
    ```

- **Display Activities Within a Time Range**

    ```bash
    ~/devopsfetch/devopsfetch.sh -t <start_time> <end_time>
    ```

- **Show Help Message**

    ```bash
    ~/devopsfetch/devopsfetch.sh -h
    ```

## Testing

### Check Script Syntax and Permissions

1. **Verify Script Content**

    Ensure the `devopsfetch.sh` script is correctly written:

    ```bash
    cat ~/devopsfetch/devopsfetch.sh
    ```

    The script should include correct options and command calls.

2. **Ensure Execute Permissions**

    ```bash
    chmod +x ~/devopsfetch/devopsfetch.sh
    ```

### Test Each Command

Run the script with each command option to verify functionality:

1. **Port Retrieval**

    ```bash
    ~/devopsfetch/devopsfetch.sh -p
    ~/devopsfetch/devopsfetch.sh -p 80
    ```

2. **Docker Retrieval**

    ```bash
    ~/devopsfetch/devopsfetch.sh -d
    ~/devopsfetch/devopsfetch.sh -d my_container
    ```

3. **Nginx Retrieval**

    ```bash
    ~/devopsfetch/devopsfetch.sh -n
    ~/devopsfetch/devopsfetch.sh -n example.com
    ```

4. **User Retrieval**

    ```bash
    ~/devopsfetch/devopsfetch.sh -u
    ~/devopsfetch/devopsfetch.sh -u username
    ```

5. **Time Range**

    ```bash
    ~/devopsfetch/devopsfetch.sh -t "2024-07-20" "2024-07-21"
    ```

6. **Help Option**

    ```bash
    ~/devopsfetch/devopsfetch.sh -h
    ```

### Check for Errors

Review error messages and troubleshoot:

- **Incorrect Paths**: Ensure all script paths are correct.
- **Missing Dependencies**: Install any required dependencies.
- **Syntax Errors**: Correct any syntax issues in the script.

### Confirm Output Formatting

Verify that outputs are correctly formatted and readable.

## Troubleshooting

- **Permission Denied Errors**: Ensure the script and log files have appropriate permissions.
- **Script Not Found**: Confirm paths are correctly specified in both the script and systemd service file.
- **Conflicting Options**: Check for conflicts in command-line options.

