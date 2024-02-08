#!/bin/bash



# Source folder (where the original folders exist)
source_folder="${PWD}/.config"

# Destination folder (where symlinks will be created)
destination_folder="${HOME}/.config"

# Check if both folders exist
if [ ! -d "$source_folder" ]; then
    echo "Source folder doesn't exist."
    exit 1
fi

if [ ! -d "$destination_folder" ]; then
    echo "Destination folder doesn't exist."
    exit 1
fi

# Loop through each folder in the source folder
for folder in "$source_folder"/*; do
    if [ -d "$folder" ]; then
        # Get the folder name
        folder_name=$(basename "$folder")
        
        # Check if the symlink already exists in the destination folder
        if [ -e "$destination_folder/$folder_name" ]; then
            echo "Symlink for '$folder_name' already exists in destination folder."
        else
            # Create symlink
            ln -s "$folder" "$destination_folder/$folder_name"
            echo "Symlink created for '$folder_name'."
        fi
    fi
done
