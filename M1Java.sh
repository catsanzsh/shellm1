#!/bin/bash

echo "🔥 Installing OpenJDK on M1 Mac... 🔥"

# Ensure Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "⚠️ Homebrew not found! Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install OpenJDK
echo "🚀 Installing OpenJDK..."
brew install openjdk

# Find latest OpenJDK version installed
JAVA_PATH=$(brew --prefix openjdk)

# Set up environment variables for OpenJDK
echo "🔧 Configuring Java environment..."
echo 'export PATH="'$JAVA_PATH'/bin:$PATH"' >> ~/.zshrc
echo 'export JAVA_HOME="'$JAVA_PATH'"' >> ~/.zshrc
source ~/.zshrc

# Verify installation
echo "✅ Java installation complete!"
java -version
