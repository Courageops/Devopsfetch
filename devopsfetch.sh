#!/bin/bash

show_help() {
    echo "Usage: devopsfetch [option] [parameter]"
    echo "Options:"
    echo "  -p, --port [PORT_NUMBER]     Display all active ports and services or details about a specific port"
    echo "  -d, --docker [CONTAINER_NAME] List all Docker images and containers or details about a specific container"
    echo "  -n, --nginx [DOMAIN]         Display all Nginx domains and their ports or details about a specific domain"
    echo "  -u, --users [USERNAME]       List all users and their last login times or details about a specific user"
    echo "  -t, --time [START] [END]     Display activities within a specified time range"
    echo "  -h, --help                   Show this help message and exit"
}

case "$1" in
    -p|--port)
        shift
        ~/devopsfetch/scripts/fetch_ports.sh "$@"
        ;;
    -d|--docker)
        shift
        ~/devopsfetch/scripts/fetch_docker.sh "$@"
        ;;
    -n|--nginx)
        shift
        ~/devopsfetch/scripts/fetch_nginx.sh "$@"
        ;;
    -u|--users)
        shift
        ~/devopsfetch/scripts/fetch_users.sh "$@"
        ;;
    -t|--time)
        shift
        ~/devopsfetch/scripts/fetch_logs.sh "$@"
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option: $1"
        show_help
        ;;
esac
