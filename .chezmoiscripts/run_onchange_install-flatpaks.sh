#!/bin/bash
set -euo pipefail

# packages hash: {{ include ".chezmoidata/packages.yaml" | sha256sum }}

echo "Installing Flatpak packages..."

# Ensure flatpak is installed
if ! command -v flatpak &> /dev/null; then
    echo "Error: flatpak is not installed. Please install flatpak first."
    exit 1
fi

# Add Flathub repository if not already added
if ! flatpak remote-list | grep -q flathub; then
    echo "Adding Flathub repository..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Read flatpak packages from chezmoi data
FLATPAK_PACKAGES=$(chezmoi data | grep -A 100 "flatpak:" | grep "^    -" | sed 's/^    - //' | grep -v "^$" || true)

if [ -z "$FLATPAK_PACKAGES" ]; then
    echo "No flatpak packages found in configuration"
    exit 0
fi

# Install each flatpak package
echo "Installing flatpak packages..."
while IFS= read -r package; do
    if [ -n "$package" ]; then
        if flatpak list --app | grep -q "^$package"; then
            echo "✓ $package already installed"
        else
            echo "Installing $package..."
            flatpak install -y flathub "$package" || echo "⚠ Failed to install $package"
        fi
    fi
done <<< "$FLATPAK_PACKAGES"

echo "✓ Flatpak packages installation complete!"
