#
#
# User configuration sourced by interactive shells
#


### Plugins ###

# # fzf
# source "$HOME/.fzf.zsh"
# # Super fast fzf search using fd!
# export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git" --type f'
# export FZF_DEFAULT_OPTS="--ansi"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zsh-async (used by other plugins)
#source "$HOME/.config/zsh/plugins/zsh-async/async.plugin.zsh"

# pure shell
#source "$HOME/.config/zsh/plugins/pure/pure.zsh"

# history settings
#source "$HOME/.config/zsh/plugins/zimfw/modules/history/init.zsh"

# git aliases
#source "$HOME/.config/zsh/plugins/zimfw/modules/git/init.zsh"

# zsh autosuggestions
#source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# syntax highlighting
#source "$HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# history search via substring
#source "$HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"

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

cd-nnn () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

alias n='cd-nnn -e'
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
#setopt PROMPT_SUBST
#export PROMPT='%B%F{red}%* %F{green}%n %F{cyan}%m %F{blue}%~ %b%F{yellow}$(git_branch)%f'$'\n''\$ '

#open blank terminal
alias bt='ZSH_NO_TMUX=true setsid alacritty -e $SHELL'

if [[ -z "$ZSH_NO_TMUX" ]] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session;
fi

preexec(){ [ $1 != $2 ] && print -r "> $2" }
#PROMPT='%* '$PROMPT
alias dotcfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source /home/jon/.config/broot/launcher/bash/br
