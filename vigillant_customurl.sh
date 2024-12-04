#!/bin/bash

# Function to validate URL
validate_url() {
    if [[ $1 =~ ^https?:// ]]; then
        return 0
    else
        return 1
    fi
}

# Prompt user for the original URL
read -p "Enter the original URL: " original_url

# Validate the original URL
if ! validate_url "$original_url"; then
    echo "Invalid URL format. Please ensure it starts with http:// or https://"
    exit 1
fi

# Prompt user for the replacement URL
read -p "Enter the replacement URL: " replacement_url

# Validate the replacement URL
if ! validate_url "$replacement_url"; then
    echo "Invalid URL format. Please ensure it starts with http:// or https://"
    exit 1
fi

# Replace the URL in the input source
echo "Replacing URL..."
echo "Original URL: $original_url"
echo "Replacement URL: $replacement_url"

# Example of replacing URL in a configuration file
# Assuming the URL is stored in 'config.txt', replace occurrences of the original URL
sed -i "s~$original_url~$replacement_url~g" config.txt

echo "URL replaced successfully in config.txt (if applicable)."
