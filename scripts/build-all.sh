#!/bin/bash

# Build for all platforms

echo "🏗️  Building Block Description for all platforms..."

# Web
echo "📱 Building web version..."
npm run build

# Android
echo "🤖 Building Android..."
npm run build:android

# iOS
echo "🍎 Building iOS..."
npm run build:ios

echo "✅ All builds complete!"
echo ""
echo "Next: Deploy manually or use npm run submit"
