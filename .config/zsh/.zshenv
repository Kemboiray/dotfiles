export ZDOTDIR="$HOME/.config/zsh"
typeset -U path PATH
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]="fg=#727169,bold"
. "$HOME/.cargo/env"
export SHELL=/bin/zsh
export CONFIG_DIR="$HOME/.config/lazygit"
[ -f "$HOME/.functions.sh" ] && source "$HOME/.functions.sh"
[ -f ".functions.sh" ] && source ".functions.sh"
add_to_path "/usr/local/bin"
add_to_path "/usr/local/go/bin"
add_to_path "$HOME/go/bin/"
add_to_path "$HOME/.fzf/bin"
command -v fzf &>/dev/null && eval "$(fzf --zsh)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && add_to_path "$PYENV_ROOT/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHONSTARTUP="$HOME/.config/python/pythonrc"
export SQLALCHEMY_SILENCE_UBER_WARNING=1
export RANGER_LOAD_DEFAULT_RC=FALSE
if hash nvim 2>/dev/null; then
  export EDITOR=nvim

  # Use nvim as manpager `:h Man`
  export MANPAGER='nvim +Man!'
else
  export EDITOR=vim
fi
export VISUAL=$EDITOR
export PAGER="$MANPAGER"
export BAT_PAGER=less
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export EZA_COLORS="ln=38;5;145:di=38;5;115:*.c=38;5;26:ex=38;5;76:*.py=38;5;31:*.js=38;5;220"
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)EZA_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --icons=always --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# export XDG_CURRENT_DESKTOP=KDE
# export KDE_SESSION_VERSION=5
# export QT_QPA_PLATFORMTHEME="gtk4"
