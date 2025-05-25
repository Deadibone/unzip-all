#!/bin/bash

# Function to display help
show_help() {
    echo "Usage: unzip_all.sh [-d] [-h]"
    echo "  -d    Delete the ZIP files after unzipping."
    echo "  -h    Display this help message."
}

# Check for command line arguments
delete_files=false

while getopts "dh" option; do
    case $option in
        d) delete_files=true ;;
        h) show_help; exit 0 ;;
        *) show_help; exit 1 ;;
    esac
done

# Unzip all .zip files in the directory
for file in *.zip; do
    if [ -f "$file" ]; then
        unzip "$file"
        if $delete_files; then
            rm "$file"
        fi
    fi
done
