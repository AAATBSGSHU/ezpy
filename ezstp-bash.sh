#!/bin/bash

# Set up the directory and script for Bash
shell_config="$HOME/.bashrc"
shell_dir="$HOME/.bash"
mkdir -p "$shell_dir/AAATBSGSHU"

# Create the ezpy.sh script
cat > "$shell_dir/AAATBSGSHU/ezpy.sh" << 'EOF'
ezpy() {
    echo -n "Enter the name of the virtual environment (or press Enter to use default 'venv'): "
    read env_name

    if [ -z "$env_name" ]; then
        env_name="venv"
    fi

    # Check if the virtual environment already exists
    if [ -d "$env_name" ]; then
        echo "Virtual environment '$env_name' already exists."
    else
        # Create the virtual environment if it doesn't exist
        python3 -m venv "$env_name"
        echo "Virtual environment '$env_name' created."
    fi

    # Activate the virtual environment
    source "$env_name/bin/activate"

    # Install dependencies if requirements.txt exists
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        echo "No requirements.txt found."
    fi

    echo "Virtual environment '$env_name' is now active. Type 'deactivate' to exit."
}
EOF

# Add sourcing to .bashrc if not already present
if ! grep -q "source $shell_dir/AAATBSGSHU/ezpy.sh" "$shell_config"; then
    echo "source $shell_dir/AAATBSGSHU/ezpy.sh" >> "$shell_config"
fi

# Notify the user
echo "The ezpy function has been set up for Bash. Please restart your terminal or run 'source $shell_config' to apply the changes."
