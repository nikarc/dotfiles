#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: mount_nas -i SHARE_IP -m MOUNT_POINT -s SHARE_NAME -u USERNAME"
    echo
    echo "Required arguments:"
    echo "  -i SHARE_IP      IP address of the Samba share"
    echo "  -m MOUNT_POINT   Local mount point directory"
    echo "  -s SHARE_NAME    Name of the shared folder"
    echo "  -u USERNAME      Samba username"
    echo
    echo "Example:"
    echo "  $0 -i 192.168.1.167 -m /mnt/share -s shared -u nick"
    exit 1
}

# Parse command line arguments
while getopts "i:m:s:u:h" opt; do
    case $opt in
        i) SHARE_IP="$OPTARG" ;;
        m) MOUNT_POINT="$OPTARG" ;;
        s) SHARE_NAME="$OPTARG" ;;
        u) USERNAME="$OPTARG" ;;
        h) usage ;;
        ?) usage ;;
    esac
done

# Verify all required arguments are provided
if [ -z "$SHARE_IP" ] || [ -z "$MOUNT_POINT" ] || [ -z "$SHARE_NAME" ] || [ -z "$USERNAME" ]; then
    echo "Error: Missing required arguments"
    usage
fi

# Set credentials file path based on username
CREDENTIALS_FILE="/home/$USER/.smbcredentials_${SHARE_NAME}"

# Function to create credentials file
create_credentials_file() {
    if [ ! -f "$CREDENTIALS_FILE" ]; then
        echo "Creating credentials file for $SHARE_NAME..."
        echo "Please enter your Samba password:"
        read -s PASSWORD

        # Create credentials file
        echo "username=$USERNAME" > "$CREDENTIALS_FILE"
        echo "password=$PASSWORD" >> "$CREDENTIALS_FILE"

        # Secure the credentials file
        chmod 600 "$CREDENTIALS_FILE"
        echo "Credentials file created and secured at $CREDENTIALS_FILE"
    fi
}

# Function to check if share is already mounted
is_mounted() {
    mount | grep -q "$MOUNT_POINT"
    return $?
}

# Function to validate IP address
validate_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        for octet in $(echo $ip | tr '.' ' '); do
            if [[ $octet -gt 255 ]]; then
                return 1
            fi
        done
        return 0
    else
        return 1
    fi
}

# Function to mount the share
mount_share() {
    # Validate IP address
    if ! validate_ip "$SHARE_IP"; then
        echo "Error: Invalid IP address format: $SHARE_IP"
        exit 1
    fi

    # Create mount point if it doesn't exist
    if [ ! -d "$MOUNT_POINT" ]; then
        sudo mkdir -p "$MOUNT_POINT"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to create mount point directory"
            exit 1
        fi
    fi

    if is_mounted; then
        echo "Share is already mounted at $MOUNT_POINT"
        return 0
    fi

    # Create credentials file if it doesn't exist
    create_credentials_file

    # Mount the share using credentials file
    echo "Mounting share..."
    sudo mount -t cifs "//$SHARE_IP/$SHARE_NAME" "$MOUNT_POINT" \
        -o credentials="$CREDENTIALS_FILE",vers=3.0,uid=$(id -u),gid=$(id -g)

    # Check if mount was successful
    if [ $? -eq 0 ]; then
        echo "Successfully mounted Samba share at $MOUNT_POINT"
    else
        echo "Failed to mount Samba share"
        return 1
    fi
}

# Function to add to fstab for automatic mounting
add_to_fstab() {
    echo "Would you like to add this share to /etc/fstab for automatic mounting? (y/n)"
    read -r REPLY
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Create fstab entry
        FSTAB_ENTRY="//$SHARE_IP/$SHARE_NAME $MOUNT_POINT cifs credentials=$CREDENTIALS_FILE,vers=3.0,uid=$(id -u),gid=$(id -g) 0 0"

        # Check if entry already exists
        if ! grep -q "$MOUNT_POINT" /etc/fstab; then
            echo "$FSTAB_ENTRY" | sudo tee -a /etc/fstab
            echo "Added to /etc/fstab. The share will automatically mount on boot."
        else
            echo "Mount point already exists in /etc/fstab"
        fi
    fi
}

# Main execution
mount_share
add_to_fstab
