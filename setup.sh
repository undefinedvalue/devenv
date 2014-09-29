SCRIPT_SOURCE=$(/bin/readlink -f ${0%/*})

# Pull in the submodules in dependencies
git submodule init
git submodule update

ln -s -t "$HOME" "$SCRIPT_SOURCE/.vimrc" "$SCRIPT_SOURCE/.zshrc" "$SCRIPT_SOURCE/.gitconfig"

mkdir "$HOME/.vim"
mkdir "$HOME/.vim/autoload"
mkdir "$HOME/.vim/bundle"
mkdir "$HOME/.vim/colors"
ln -s -t "$HOME/.vim/autoload" "$SCRIPT_SOURCE/dependencies/vim-pathogen/autoload/"*
ln -s -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-sensible/"*
ln -s -t "$HOME/.vim/colors" "$SCRIPT_SOURCE/.vim/colors/"*
