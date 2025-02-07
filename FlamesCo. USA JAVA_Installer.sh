#!/bin/bash

echo "🔥 Installing OpenJDK on M1 Mac... 🔥"

# Ensure Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "⚠️ Homebrew not found! Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is already installed."
fi

# Check if OpenJDK is already installed
if ! brew ls --versions openjdk &> /dev/null; then
    # Install OpenJDK
    echo "🚀 Installing OpenJDK..."
    brew install openjdk
else
    echo "✅ OpenJDK is already installed."
fi

# Find latest OpenJDK version installed
JAVA_PATH=$(brew --prefix openjdk)

# Set up environment variables for OpenJDK
echo "🔧 Configuring Java environment..."
if ! grep -q 'export PATH="'$JAVA_PATH'/bin:$PATH"' ~/.zshrc; then
    echo 'export PATH="'$JAVA_PATH'/bin:$PATH"' >> ~/.zshrc
    echo "🔧 PATH environment variable updated."
else
    echo "✅ PATH environment variable already set."
fi

if ! grep -q 'export JAVA_HOME="'$JAVA_PATH'"' ~/.zshrc; then
    echo 'export JAVA_HOME="'$JAVA_PATH'"' >> ~/.zshrc
    echo "🔧 JAVA_HOME environment variable updated."
else
    echo "✅ JAVA_HOME environment variable already set."
fi

# Apply the changes to the current session
source ~/.zshrc

# Verify installation
echo "✅ Java installation complete!"
java -version