#!/bin/bash

echo "🚀 Setting up Solana development environment..."

# Update system
echo "📦 Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install essential packages
echo "🔧 Installing essential packages..."
sudo apt-get install -y curl wget git build-essential pkg-config libudev-dev libssl-dev

# Install Rust toolchain
echo "🦀 Installing latest Rust toolchain..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Reload environment to pick up Rust
source ~/.bashrc || source ~/.profile
# Verify Rust installation
echo "✅ Rust installed:"
rustc --version
cargo --version

# Install Solana CLI
echo "⚡ Installing Solana CLI v1.18.26..."
# Create directory structure for Solana
mkdir -p ~/.local/share/solana/install/releases/1.18.26
# Navigate to the release directory
cd ~/.local/share/solana/install/releases/1.18.26
# Download the latest Solana release
wget https://github.com/solana-labs/solana/releases/download/v1.18.26/solana-release-x86_64-unknown-linux-gnu.tar.bz2
# Extract the binaries (this removes the nested directory structure)
tar -xjf solana-release-x86_64-unknown-linux-gnu.tar.bz2 --strip-components=1
# Remove the downloaded archive to save space
rm solana-release-x86_64-unknown-linux-gnu.tar.bz2
# Create the active release symlink (this allows easy version switching later)
cd ~/.local/share/solana/install/
ln -sf releases/1.18.26 active_release
# Add Solana to PATH permanently
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
# Reload environment
source ~/.bashrc || source ~/.profile
echo "✅ Solana CLI 1.18.26 installed"
# Verify Solana installation
solana --version
cargo-build-sbf --version

# Install Anchor CLI using AVM
echo "⚓ Installing Anchor CLI v0.31.0..."
# Install Anchor Version Manager
cargo install --git https://github.com/coral-xyz/anchor avm
# Use AVM to install and set Anchor 0.31
avm install 0.31.0
avm use 0.31.0
echo "✅ Anchor CLI 0.31.0 installed"
# Verify Anchor installation
anchor --version

# Install Node.js dependencies
echo "📦 Installing TypeScript..."
npm install -g typescript ts-node
echo "✅ TypeScript installed"

# Create project structure
echo "📁 Creating project structure..."
mkdir -p ~/solana-projects
cd ~/solana-projects

echo ""
echo "🎉 Setup complete! Solana arbitrage development environment is ready."
echo ""
echo "📋 Installation Summary:"
echo "  • Rust: $(rustc --version | cut -d' ' -f2)"
echo "  • Solana CLI: $(solana --version | cut -d' ' -f2)"
echo "  • Anchor: $(anchor --version | cut -d' ' -f3)"
echo "  • Project directory: ~/solana-projects"
echo ""
echo "⚠️  Important: Run 'source ~/.bashrc' to reload your environment"
echo "   or start a new terminal session to use the installed tools."
echo ""
echo "🚀 You can now start building Solana arbitrage bots!"
