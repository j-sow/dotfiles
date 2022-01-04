#
#
# User configuration sourced by interactive shells
#


### Plugins ###
ZPLUG_HOME="$HOME/.config/zplug/"
ZPLUG_REPOS="$ZPLUG_HOME/repos"
source "$ZPLUG_HOME/init.zsh"

zplug 'zimfw/environment', from:github
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zimfw/git', use:init.zsh, from:github
zplug 'zsh-users/zsh-autosuggestions', use:zsh-autosuggestions.zsh, from:github
zplug 'zdharma-continuum/fast-syntax-highlighting', from:github
zplug 'zsh-users/zsh-history-substring-search', from:github
zplug 'agkozak/zsh-z', from:github
zplug 'zsh-users/zsh-completions', depth:1


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

### Settings ###

# Enable autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
autoload -U bashcompinit
bashcompinit
# Disable the super annoying CTRL+D logout
setopt IGNORE_EOF

# vi mode!
bindkey -v
# Up/down history search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# some language stuff
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

### Aliases ###
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias serve='budo'
alias l='exa'
alias ll='exa -l'
alias la='exa -la'
alias :q='exit'
# git habits never die
alias gst='gws'
alias gd='git diff'
alias gl='git log --topo-order --oneline --decorate --color --graph'
alias glog='gl'
# fuzzy find branch
alias gcf='gco $(gb | fzf)'
# fuzzy open a file with bat
alias b='bat $(fzf)'
# copy & paste galore!
alias c='pbcopy'
alias p='pbpaste'
# Lazy apps
alias yd='youtube-dl'

# find and replace in project
fr () {
 sd -i $1 $2 $(rg -l $1) 
}

# path
export PATH="/usr/local/sbin:$PATH"

### Other tools ###
export NNN_PLUG='o:fzopen'
export EDITOR='nvim'

#llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Rust
#source "$HOME/.cargo/env"
export WINIT_X11_SCALE_FACTOR=1


lsdir () {
        ls -la --color=always $@ | awk 'match($1, /^d/)'
}

lsdot () {
        ls -la --color=always $@ | awk 'match($9, /^\./)'
}

lsf () {
        ls -la --color=always $@ | awk 'match($1, /^-/)'
}

git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

#open blank terminal
alias bt='ZSH_NO_TMUX=true setsid alacritty -e $SHELL'

if [[ -z "$ZSH_NO_TMUX" ]] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session;
fi

preexec(){ [ $1 != $2 ] && print -r "> $2" }
alias dotcfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [[ -f ~/.zshrc_extra ]]; then
  source ~/.zshrc_extra
fi
