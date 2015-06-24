#!/usr/bin/env zsh
readlink_cmd=readlink
ln_cmd=ln

if [[ $(uname) == 'Darwin' ]]; then
  # requires GNU coreutils. OS X decided to implement their
  # own crappy versions that don't work the same.
  readlink_cmd=greadlink
  ln_cmd=gln
fi

SCRIPT_SOURCE=$($readlink_cmd -f ${0%/*})
pushd $SCRIPT_SOURCE

# Force this repository to use my public info
git config user.name 'Anna Bell'
git config user.email 'undefinedvalue@users.noreply.github.com'

# Pull in the submodules in dependencies
git submodule init
git submodule update

# One of my hosts hangs when loading the most recent commit of pathogen
# Use v2.3, which seems stable
pushd dependencies/vim-pathogen
git checkout tags/v2.3
popd

$ln_cmd -s -t "$HOME" "$SCRIPT_SOURCE/.vimrc" "$SCRIPT_SOURCE/.zshrc" "$SCRIPT_SOURCE/.gitconfig" "$SCRIPT_SOURCE/.tmux.conf"

mkdir "$HOME/.vim" > /dev/null 2>&1
mkdir "$HOME/.vim/autoload" > /dev/null 2>&1
mkdir "$HOME/.vim/bundle" > /dev/null 2>&1
mkdir "$HOME/.vim/colors" > /dev/null 2>&1
$ln_cmd -s -f -t "$HOME/.vim/autoload" "$SCRIPT_SOURCE/dependencies/vim-pathogen/autoload/"*
$ln_cmd -s -f -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-rails"
$ln_cmd -s -f -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-haml"
$ln_cmd -s -f -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-coffee-script"
$ln_cmd -s -f -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-slim"
$ln_cmd -s -f -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/screen"
$ln_cmd -s -f -t "$HOME/.vim/colors" "$SCRIPT_SOURCE/.vim/colors/"*

# Set up ruby
mkdir "$HOME/.rbenv" > /dev/null 2>&1
$ln_cmd -s -f -t "$HOME/.rbenv" "$SCRIPT_SOURCE/dependencies/rbenv/"*
mkdir "$HOME/.rbenv/plugins" > /dev/null 2>&1
$ln_cmd -s -f -t "$HOME/.rbenv/plugins" "$SCRIPT_SOURCE/dependencies/ruby-build"

popd
