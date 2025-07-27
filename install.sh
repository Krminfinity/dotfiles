#!/bin/bash

# Codespace作成時に実行される個人用のセットアップスクリプト

echo "--- Starting Personal Dotfiles Setup ---"

# 1. NVM (Node.jsバージョン管理ツール) と Node.js をインストール
if [ ! -d "${HOME}/.nvm" ]; then
  echo "Installing nvm (Node Version Manager)..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# nvmコマンドを有効化
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Node.jsのLTS(長期サポート)版をインストール
echo "Installing Node.js LTS..."
nvm install --lts

# 2. Gemini CLI をインストール
if ! command -v gemini &> /dev/null; then
  echo "Installing Gemini CLI..."
  npm install -g @google/gemini-cli
else
  echo "Gemini CLI is already installed."
fi

echo "--- Personal Dotfiles Setup Complete ---"
