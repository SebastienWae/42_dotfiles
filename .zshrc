# install zcomet if needed
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# load zcomet
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# path
export PATH=$PATH:~/goinfre/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH=$PATH:/Users/$USER/Library/Python/3.8/bin
export PATH=$PATH:/Library/Developer/CommandLineTools/Library/PrivateFrameworks/LLDB.framework/Resources
export PATH=~/goinfre/.brew/opt/llvm/bin:$PATH

# Load Homebrew config script
source $HOME/.brewconfig.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zcomet load Aloxaf/fzf-tab

# load pluginds
zcomet load jeffreytse/zsh-vi-mode
zcomet load hlissner/zsh-autopair
zcomet load zsh-users/zsh-completions
zcomet load zdharma-continuum/fast-syntax-highlighting

# auto suggestion
zcomet load zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# alias
alias la="ls -la"
alias norm=norminette

# config
setopt globdots

# history
export HISTFILE=.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

# run compinit and compile its cache
zcomet compinit

# starship prompt
eval "$(starship init zsh)"
