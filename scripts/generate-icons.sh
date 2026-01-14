#!/bin/bash

# Install imagemagick if needed
# brew install imagemagick (macOS) or apt-get install imagemagick (Linux)

# Create icon directories
mkdir -p assets

# Generate app icon from template
convert -size 1024x1024 xc:'#0a0a14' \
  -gravity center \
  -pointsize 200 \
  -fill '#4DD0E1' \
  -annotate 0 'BD' \
  assets/icon.png

# Generate splash screen
convert -size 1080x2340 xc:'#0a0a14' \
  -gravity center \
  -pointsize 100 \
  -fill '#FFD700' \
  -annotate 0 'Block\nDescription' \
  assets/splash.png

# Generate adaptive icon for Android
cp assets/icon.png assets/adaptive-icon.png

echo "Icons generated successfully!"
