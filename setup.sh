#!/bin/bash

GOINFRE="/goinfre/$USER"

# install homebrew
if [ ! -d $GOINFRE/.brew ]; then
  echo "###### INSTALLING HOMEBREW ######"
  git clone --depth=1 https://github.com/Homebrew/brew $GOINFRE/.brew

  cat > $HOME/.brewconfig.zsh <<EOL
export PATH=/goinfre/\$USER/.brew/bin:\$PATH

export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches
export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp

mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP

if df -T autofs,nfs \$HOME 1>/dev/null
then
  HOMEBREW_LOCKS_TARGET=/tmp/\$USER/Homebrew/Locks
  HOMEBREW_LOCKS_FOLDER=\$HOME/.brew/var/homebrew

  mkdir -p \$HOMEBREW_LOCKS_TARGET
  mkdir -p \$HOMEBREW_LOCKS_FOLDER

  if ! [[ -L \$HOMEBREW_LOCKS_FOLDER && -d \$HOMEBREW_LOCKS_FOLDER ]]
  then
     echo "Creating symlink for Locks folder"
     rm -rf \$HOMEBREW_LOCKS_FOLDER
     ln -s \$HOMEBREW_LOCKS_TARGET \$HOMEBREW_LOCKS_FOLDER
  fi
fi
EOL

  if ! grep -q -v ".brewconfig.zsh" $HOME/.zshrc ; then
    echo "source \$HOME/.brewconfig.zsh" >> $HOME/.zshrc
  fi

  source $HOME/.brewconfig.zsh
  brew analytics off
  brew update
  echo ""
fi

# install jq
echo "###### INSTALLING JQ ######"
brew install jq
echo ""

# install vscode
echo "###### INSTALLING VSCODE ######"
VSCODE_VERSION=$(curl -s https://formulae.brew.sh/api/cask/visual-studio-code.json | jq .version -r)
VSCODE_INSTALLED=$(/usr/libexec/PlistBuddy -c 'Print CFBundleVersion' "$GOINFRE/Visual Studio Code.app/Contents/Info.plist")
if [ ! $? -eq 0 ] || [ "$VSCODE_VERSION" != "$VSCODE_INSTALLED" ] ; then
	rm -rf "$GOINFRE/Visual Studio Code.app"
	curl -L https://update.code.visualstudio.com/$VSCODE_VERSION/darwin/stable -o $GOINFRE/vscode.zip
	unzip $GOINFRE/vscode.zip -d $GOINFRE
	rm $GOINFRE/vscode.zip
	xattr -dr com.apple.quarantine "$GOINFRE/Visual Studio Code.app"
fi
if [ ! -d $GOINFRE/code-portable-data ]; then
	mkdir $GOINFRE/code-portable-data
fi
echo ""

## install python
#echo "###### INSTALLING PYTHON ######"
#brew install python
#echo ""
#
## install cmake
#echo "###### INSTALLING CMAKE ######"
#brew install cmake
#echo ""
#
## install ninja
#echo "###### INSTALLING CMAKE ######"
#brew install cmake
#echo ""
#
## install llvm
#echo "###### INSTALLING LLVM ######"
#brew install llvm
#echo ""
#
## install starship
#echo "###### INSTALLING STARSHIP ######"
#brew install starship
#echo ""
#
# install fzf
echo "###### INSTALLING FZF ######"
brew install fzf
echo ""

## install ripgrep
echo "###### INSTALLING RIPGREP ######"
brew install ripgrep
echo ""

# install codechecker
#echo "###### INSTALLING CODECHECKER ######"
#pip3 install --user codechecker
#echo ""

# install valgrind
#echo "###### INSTALLING VALGRIND ######"
#brew tap LouisBrunner/valgrind
#brew install --HEAD LouisBrunner/valgrind/valgrind

# install bash-completion
echo "###### INSTALLING BASH-COMPLETION ######"
brew install bash-completion
echo ""

# add brew fonts cask
echo "###### ADDING BREW FONTS CASK ######"
brew tap homebrew/cask-fonts
echo ""

# install IBM Plex Mono font
echo "###### INSTALLING IBM PLEX MONO FONT ######"
brew install font-ibm-plex-mono
echo ""

