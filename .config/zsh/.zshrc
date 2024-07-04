setopt autocd
bindkey -v
# Remove delay when entering normal mode (vi)
KEYTIMEOUT=1
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

zstyle :compinstall filename '/home/kemboiray/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f "$HOME/.pnpm.sh" ] && source "$HOME/.pnpm.sh"
# printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'
export HISTFILE="$HOME/.config/zsh/histfile"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

eval "$(direnv hook zsh)"
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi

source "$ZDOTDIR/plugins"
if [[ ! $WARP_IS_LOCAL_SHELL_SESSION ]]; then
  eval "$(starship init zsh)"
fi

eval "$(zoxide init zsh)"

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# pnpm
export PNPM_HOME="/home/kemboiray/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
