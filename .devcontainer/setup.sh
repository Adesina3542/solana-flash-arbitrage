#!/bin/bash
echo "🚀 Setting up Solana development environment..."

# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install essential packages
sudo apt-get install -y curl wget git build-essential pkg-config libudev-dev libssl-dev

# Install specific Rust version
rustup install 1.78.0
rustup default 1.78.0
echo "✅ Rust 1.78.0 installed"

# Install Solana CLI
sh -c "$(curl -sSfL https://release.solana.com/v1.18.15/install)"
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc
echo "✅ Solana CLI 1.18.15 installed"

# Install Anchor CLI
cargo install --git https://github.com/coral-xyz/anchor --tag v0.29.0 anchor-cli
echo "✅ Anchor CLI 0.29.0 installed"

# Install Node.js dependencies
npm install -g typescript ts-node
echo "✅ TypeScript installed"

# Create project structure
mkdir -p ~/solana-projects
cd ~/solana-projects

echo "🎉 Setup complete! Ready for Solana development."
echo "Run: source ~/.bashrc to reload environment"
