SCRIPT_SOURCE=$(/bin/readlink -f ${0%/*})

ln -s -t "$HOME" "$SCRIPT_SOURCE/.vimrc" "$SCRIPT_SOURCE/.zshrc"

mkdir "$HOME/.vim"
mkdir "$HOME/.vim/autoload"
mkdir "$HOME/.vim/bundle"
mkdir "$HOME/.vim/colors"
ln -s -t "$HOME/.vim/autoload" "$SCRIPT_SOURCE/dependencies/vim-pathogen/autoload/"*
ln -s -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-sensible/"*
ln -s -t "$HOME/.vim/colors" "$SCRIPT_SOURCE/.vim/colors/"*
