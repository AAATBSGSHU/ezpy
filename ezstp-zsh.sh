#!/bin/bash

# Set up the directory and script for Zsh
shell_config="$HOME/.zshrc"
shell_dir="$HOME/.zsh"
mkdir -p "$shell_dir/AAATBSGSHU"

cat > "$shell_dir/AAATBSGSHU/ezpy.sh" << 'EOF'
ezpy() {
    echo -n "Enter the name of the virtual environment (or press Enter to use default 'venv'): "
    read env_name

    if [ -z "$env_name" ]; then
        env_name="venv"
    fi

    if [ -d "$env_name" ]; then
        echo "Virtual environment '$env_name' already exists."
    else
        python3 -m venv "$env_name"
        echo "Virtual environment '$env_name' created."
    fi

    source "$env_name/bin/activate"

    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    else
        echo "No requirements.txt found."
    fi

    echo "Virtual environment '$env_name' is now active. Type 'deactivate' to exit."
}
EOF

if ! grep -q "source $shell_dir/AAATBSGSHU/ezpy.sh" "$shell_config"; then
    echo "source $shell_dir/AAATBSGSHU/ezpy.sh" >> "$shell_config"
fi

echo "The ezpy function has been set up for Zsh. Please restart your terminal or run 'source $shell_config' to apply the changes."
