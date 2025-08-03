#!/bin/bash

# TypeScript Bootstrap Project Installer
# Usage: ./install-project.sh <target-directory>

# Check if target directory is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target-directory>"
    echo "Example: $0 ~/my-new-typescript-project"
    exit 1
fi

TARGET_DIR="$1"

# Check if target directory already exists
if [ -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' already exists."
    echo "Please specify a different directory or remove the existing one."
    exit 1
fi

# Create target directory
echo "Creating directory: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Copy project files (excluding node_modules, dist, and other generated files)
echo "Copying project files..."
cp -r src "$TARGET_DIR/"
cp index.html "$TARGET_DIR/"
cp styles.css "$TARGET_DIR/"
cp package.json "$TARGET_DIR/"
cp tsconfig.json "$TARGET_DIR/"
cp README.md "$TARGET_DIR/"
cp .gitignore "$TARGET_DIR/"

# Verify key files were copied
echo "Verifying copied files..."
if [ ! -f "$TARGET_DIR/src/app.ts" ]; then
    echo "Error: app.ts was not copied successfully!"
    exit 1
fi
echo "✅ app.ts copied successfully"

# Change to target directory
cd "$TARGET_DIR"

# Install dependencies
echo "Installing dependencies..."
npm install

# Build the project
echo "Building the project..."
npm run build

echo ""
echo "✅ Project successfully installed in: $TARGET_DIR"
echo ""
echo "To run the project:"
echo "  cd $TARGET_DIR"
echo "  npm start"
echo ""
echo "To start development with watch mode:"
echo "  cd $TARGET_DIR"
echo "  npm run watch"
echo ""
echo "Happy coding! 🚀" 