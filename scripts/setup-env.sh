#!/bin/bash

# Setup environment for cross-platform development

echo "Setting up Block Description environment..."

# Install dependencies
npm install

# Setup EAS
echo "Logging into EAS..."
eas login

# Configure for iOS
read -p "Deploy to iOS? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  eas build --platform ios --profile preview
fi

# Configure for Android
read -p "Deploy to Android? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  eas build --platform android --profile preview
fi

echo "Setup complete! Run 'npm start' to begin development."
