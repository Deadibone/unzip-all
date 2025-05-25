#!/bin/bash

# Define the target installation directory
TARGET_DIR="/usr/local/bin"
SCRIPT_NAME="unzip_all"

# Create the script
cat << 'EOF' > "$TARGET_DIR/$SCRIPT_NAME"
#!/bin/bash

# Function to display help
show_help() {
    echo "Usage: unzip_all [-d] [-h]"
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

# Unzip all .zip files in the current directory
for file in *.zip; do
    if [ -f "$file" ]; then
        unzip "$file"
        if $delete_files; then
            rm "$file"
        fi
    fi
done
EOF

# Make the script executable
chmod +x "$TARGET_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME has been installed in $TARGET_DIR."
