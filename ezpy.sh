#!/bin/bash

read -p "Enter the name of the virtual environment (or press Enter to use default 'venv'): " env_name

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

if [ -f "requirements.txt" ] && [ ! -d "$env_name" ]; then
    pip install -r requirements.txt
else
    if [ -f "requirements.txt" ]; then
        echo "Requirements already installed."
    else
        echo "No requirements.txt found."
    fi
fi

echo "Virtual environment '$env_name' is now active. Type 'deactivate' to exit."
