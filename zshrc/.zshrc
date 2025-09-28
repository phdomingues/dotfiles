# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt sharehistory
# FZF-TAB
setopt GLOB_DOTS # Show hidden (dot) files

# COMPLETION STYLE
zstyle :compinstall filename '/home/phsd/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:*' continuous-trigger '/'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept

unsetopt autocd beep extendedglob notify
bindkey -v

# ALIAS
alias ls='eza'
alias grep='grep --color=auto'

# ENV VARIABLES
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_CACHE=$HOME/.cache
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64
export TORCH_CUDA_ARCH_LIST="8.6"

# ZINIT
# configuration
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# plugins
zinit light zsh-users/zsh-syntax-highlighting # syntax highlighting
zinit light zsh-users/zsh-completions # terminal autocompletion
zinit light zsh-users/zsh-autosuggestions # terminal suggestion when typing
zinit light Aloxaf/fzf-tab
# load completions
autoload -U compinit && compinit
zinit cdreplay -q

# SHELL INTEGRATIONS
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# MISCELANEOUS
# fastfetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<