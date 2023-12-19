# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kemboiray/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kemboiray/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/kemboiray/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/kemboiray/.fzf/shell/key-bindings.bash"
