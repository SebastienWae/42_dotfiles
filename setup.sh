#!/bin/bash

if [ ! -d "/goinfre/$USER/.brew" ]; then
  # install homebrew
  echo "###### INSTALLING HOMEBREW ######"
  curl -fsSL https://raw.githubusercontent.com/omimouni/42homebrew/master/install-goinfre.sh | zsh
  echo ""
fi

# install jq
echo "###### INSTALLING JQ ######"
brew install jq
echo ""

# install vscode
echo "###### INSTALLING VSCODE ######"
VSCODE_VERSION=$(curl -s https://formulae.brew.sh/api/cask/visual-studio-code.json | jq .version -r)
curl -L https://update.code.visualstudio.com/$VSCODE_VERSION/darwin/stable -o ~/goinfre/vscode.zip
unzip ~/goinfre/vscode.zip -d ~/goinfre
rm ~/goinfre/vscode.zip
xattr -dr com.apple.quarantine ~/goinfre/Visual\ Studio\ Code.app
mkdir ~/goinfre/code-portable-data
echo ""

# install starship
echo "###### INSTALLING STARSHIP ######"
brew install starship
echo ""

# install fzf
echo "###### INSTALLING FZF ######"
brew install fzf
echo ""

# install ripgrep
echo "###### INSTALLING RIPGREP ######"
brew install ripgrep
echo ""

# install bear
echo "###### INSTALLING BEAR ######"
brew install bear
echo ""

# install node
echo "###### INSTALLING NODE ######"
brew install node
echo ""

# install llvm
echo "###### INSTALLING LLVM ######"
brew install llvm
echo ""

# install codechecker
echo "###### INSTALLING CODECHECKER ######"
pip3 install --user codechecker
echo ""

# install valgrind
echo "###### INSTALLING VALGRIND ######"
brew tap LouisBrunner/valgrind
brew install --HEAD LouisBrunner/valgrind/valgrind
echo ""

# install bash-completion
echo "###### INSTALLING BASH-COMPLETION ######"
brew install bash-completion
echo ""

# install jetbrains mono
echo "###### INSTALLING JETBRAINS MONO ######"
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono
echo ""
