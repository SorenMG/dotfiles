#!/bin/zsh
# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'Installed brew'

# Install dependencies
brew bundle
echo 'Installed dependecies'

# Change from bash to zsh
chsh -s /bin/zsh
echo 'Changed to ZSH'

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo 'Installed oh-my-zsh'

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'Installed vim-plug'

# Install vim plugins
vim +PlugInstall
echo 'Installed vim plugins'

# Install config files in the correct dir
cp .skhdrc ~
mkdir -p ~/.config/nvim/ && cp init.vim ~/.config/nvim/
cp .yabairc ~
mkdir -p ~/.config/alacritty/ && cp alacritty.yml ~/.config/alacritty/
cp .zshrc ~
echo 'Added configuration files'
