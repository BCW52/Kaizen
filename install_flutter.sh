#!/bin/bash

# Define the installation directory
FLUTTER_INSTALL_DIR="$HOME/development"
FLUTTER_SDK_URL="https://flutter.dev/docs/get-started/install/linux"
FLUTTER_TAR_URL="https://flutter.dev/docs/get-started/install/linux/release/linux_x64/flutter_linux_3.13.8-stable.tar.xz"

# Install Flutter
if ! command -v flutter &> /dev/null; then
  echo "Flutter not found. Installing..."
  
  # Create the installation directory
  mkdir -p "$FLUTTER_INSTALL_DIR"
  
  # Download and extract Flutter
  cd "$FLUTTER_INSTALL_DIR"
  curl -O -L "$FLUTTER_TAR_URL"
  tar -xvf "flutter_linux_3.13.8-stable.tar.xz"
  
  # Add Flutter to the PATH for this session
  export PATH="$PATH:$FLUTTER_INSTALL_DIR/flutter/bin"
  
  echo "Flutter installation completed."
else
  echo "Flutter is already installed."
fi

# Check if Flutter is in the PATH for all future sessions
if ! grep -q "flutter/bin" "$HOME/.bashrc"; then
  echo 'export PATH="$PATH:'"$FLUTTER_INSTALL_DIR"'/flutter/bin"' >> "$HOME/.bashrc"
  echo "PATH updated for all future sessions."
fi

# Print installation instructions
echo "Please review the Flutter installation instructions at:"
echo "$FLUTTER_SDK_URL"

# Verify Flutter installation
flutter --version
