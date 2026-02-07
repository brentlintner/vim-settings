#!/usr/bin/env sh

set -e

OS=$(uname -s)

SETTINGS_REPO="git@github.com:brentlintner/vim-settings"

SETTINGS_SRC_DIR="$HOME/src/vim-settings"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_DATA_DIR="$HOME/.local/share/nvim"

check_tooling() {
  set -- \
    rg \
    python3 \
    pip \
    lua \
    luarocks \
    node \
    npm \
    ruby \
    gem \
    nvim

  echo "==> Checking available tooling..."
  for tool in "$@"; do
    check_tool "$tool"
  done
}

install_brew_packages() {
  set -- \
    ripgrep \
    luarocks \
    python3 \
    node \
    ruby

  echo "==> [MacOS] Installing dependencies with Homebrew..."
  echo "$@"
  brew install "$@"
}

tooling_post_install() {
  set -- \
    "pip install pynvim" \
    "gem install solargraph neovim" \
    "npm install -g neovim"

  for cmd in "$@"; do
    echo "==> $cmd"
    eval "$cmd"
  done
}

install_repo() {
  echo "==> Cloning vim-settings repository to $SETTINGS_SRC_DIR..."
  if [ ! -d "$SETTINGS_SRC_DIR" ]; then
    git clone $SETTINGS_REPO $SETTINGS_SRC_DIR
  else
    echo "==> Directory $SETTINGS_SRC_DIR already exists. Skipping clone."
  fi

  echo "==> Changing to $SETTINGS_SRC_DIR directory..."
  cd $SETTINGS_SRC_DIR

  echo "==> Cleaning up existing Neovim configuration..."
  rm -rf $NVIM_CONFIG_DIR

  echo "==> Symlinking to $NVIM_CONFIG_DIR"
  ln -s $SETTINGS_SRC_DIR $NVIM_CONFIG_DIR
}

check_tool() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: $1 is not installed. Please install it and try again."
    exit 1
  fi
}

install_dependencies() {
  echo "==> Installing dependencies..."

  if [ "$OS" = "Darwin" ]; then
    echo "==> [MacOS] Installing dependencies with Homebrew..."
    install_brew_packages
  elif [ "$OS" = "Linux" ]; then
    echo "==> [Linux] Skipping... You may need to install ripgrep, luarocks, python, node, and ruby manually."
  fi

  check_tooling

  tooling_post_install
}

configure_nvim() {
  nvim --headless "+Lazy! sync" +qa
  nvim --headless +TSUpdateSync +qa
  nvim --headless +CocUpdateSync +qa
  nvim --headless +UpdateRemotePlugins +qa
  echo "==> Checking Neovim health..."
  nvim --headless -es +checkhealth +"w! /dev/stdout" +qa
}

main() {
  echo "==> Configuring Neovim..."
  install_repo
  install_dependencies
  configure_nvim
  echo "==> Setup complete!"
}

main
