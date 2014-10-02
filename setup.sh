SCRIPT_SOURCE=$(readlink -f ${0%/*})

# Pull in the submodules in dependencies
git submodule init
git submodule update

ln -s -t "$HOME" "$SCRIPT_SOURCE/.vimrc" "$SCRIPT_SOURCE/.zshrc" "$SCRIPT_SOURCE/.gitconfig" "$SCRIPT_SOURCE/.tmux.conf"

mkdir "$HOME/.vim"
mkdir "$HOME/.vim/autoload"
mkdir "$HOME/.vim/bundle"
mkdir "$HOME/.vim/colors"
ln -s -t "$HOME/.vim/autoload" "$SCRIPT_SOURCE/dependencies/vim-pathogen/autoload/"*
ln -s -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-rails"
ln -s -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/vim-haml"
ln -s -t "$HOME/.vim/bundle" "$SCRIPT_SOURCE/dependencies/screen"
ln -s -t "$HOME/.vim/colors" "$SCRIPT_SOURCE/.vim/colors/"*
