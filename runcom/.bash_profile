# chris_bash_profile

# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x readlink ]]; then
  SCRIPT_PATH=$(readlink -n $CURRENT_SCRIPT)
  DOTFILES_DIR="${PWD}/$(dirname $(dirname $SCRIPT_PATH))"
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)
# {function_*}

for DOTFILE in "$DOTFILES_DIR"/chris/.{function,path,env,exports,alias,fnm,grep,prompt,completion,fix,zoxide}; do
  . "$DOTFILE"
done

# if is-macos; then
#  for DOTFILE in "$DOTFILES_DIR"/chris/.{env,alias,function}.macos; do
#    . "$DOTFILE"
#  done
# fi

# Set LSCOLORS

eval "$(gdircolors -b "$DOTFILES_DIR"/chris/.dir_colors)"

# Wrap up

unset CURRENT_SCRIPT SCRIPT_PATH DOTFILE
export DOTFILES_DIR
