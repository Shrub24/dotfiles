#!/bin/bash
set -euo pipefail

echo "Installing required tools..."

# Install Bitwarden Secrets CLI (bws)
if ! command -v bws &> /dev/null; then
    echo "Installing Bitwarden Secrets CLI (bws)..."
    
    ARCH="x86_64"
    # Download and install bws
    BWS_VERSION="1.0.0"  # Update this to the latest version
    BWS_URL="https://github.com/bitwarden/sdk-sm/releases/download/bws-v${BWS_VERSION}/bws-${AARCH}-unknown-linux-gnu-1.0.0.zip"
    
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"
    
    echo "Downloading bws from $BWS_URL..."
    curl -fsSL "$BWS_URL" -o bws.zip
    unzip -q bws.zip
    chmod +x bws
    
    # Install to ~/.local/bin
    mkdir -p "$HOME/.local/bin"
    mv bws "$HOME/.local/bin/"
    
    cd -
    rm -rf "$TMP_DIR"
    
    echo "✓ bws installed successfully"
else
    echo "✓ bws already installed"
fi

# Add more tools here as needed
# Example:
# if ! command -v some-tool &> /dev/null; then
#     echo "Installing some-tool..."
#     # installation commands
# fi

echo "All required tools installed!"
