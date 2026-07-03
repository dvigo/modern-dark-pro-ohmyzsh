#!/bin/bash

# ------------------------------------------------------------------------------
# Modern Dark Pro Zsh Theme - Installation Script
# This script symlinks or copies the theme to the Oh My Zsh custom themes directory.
# ------------------------------------------------------------------------------

set -e

THEME_NAME="modern-dark-pro"
THEME_FILE="${THEME_NAME}.zsh-theme"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define destination directory
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
DEST_DIR="${ZSH_CUSTOM}/themes"
DEST_FILE="${DEST_DIR}/${THEME_FILE}"

echo "🎨 Installing Modern Dark Pro Zsh Theme..."

# Check if Oh My Zsh is installed
if [ ! -d "$ZSH_CUSTOM" ]; then
    echo "❌ Error: Oh My Zsh custom directory not found at: $ZSH_CUSTOM"
    echo "Please ensure Oh My Zsh is installed before running this script."
    exit 1
fi

# Create custom/themes directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Handle existing theme file
if [ -L "$DEST_FILE" ] || [ -f "$DEST_FILE" ]; then
    echo "⚠️  Existing theme file found at: $DEST_FILE"
    read -p "Do you want to overwrite it? [y/N] " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    rm -f "$DEST_FILE"
fi

# Link theme file (symlink is better so changes in repo reflect immediately)
echo "🔗 Creating symlink to theme file..."
ln -s "${SCRIPT_DIR}/${THEME_FILE}" "$DEST_FILE"

echo "✅ Modern Dark Pro Zsh Theme installed successfully!"
echo ""
echo "To activate the theme:"
echo "1. Open your ~/.zshrc file."
echo "2. Find the line: ZSH_THEME=\"...\""
echo "3. Change it to: ZSH_THEME=\"${THEME_NAME}\""
echo ""
echo "🎨 Configuration Options (add to your ~/.zshrc before sourcing oh-my-zsh):"
echo "  # Choose color variant: 'night' (default) or 'monokai'"
echo "  export MODERN_DARK_PRO_VARIANT=\"night\""
echo ""
echo "  # Custom prompt character (default: ❯)"
echo "  export MODERN_DARK_PRO_CHAR=\"❯\""
echo ""
echo "  # Enable developer icons/Nerd Fonts (default: false)"
echo "  export MODERN_DARK_PRO_NERD_FONTS=true"
echo ""
echo "Please reload your shell (run 'source ~/.zshrc' or open a new window) to apply! ✨"
