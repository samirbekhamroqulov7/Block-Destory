#!/bin/bash

# Setup script for mobile development

echo "🚀 Setting up Block Description for mobile development..."

# Check if Node is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is required but not installed."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Install Expo CLI
echo "🔧 Installing Expo CLI..."
npm install -g eas-cli

# Initialize EAS
echo "🔐 Initializing EAS..."
eas init

# Ask for Apple credentials (optional)
read -p "Do you want to configure Apple credentials now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    eas credentials
fi

# Ask for Google Play credentials (optional)
read -p "Do you want to configure Google Play credentials now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    eas credentials
fi

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Update app.json with your app details"
echo "2. Run: npm run build:android or npm run build:ios"
echo "3. Submit with: npm run submit"
