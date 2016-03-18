# Create GitHub directory
if ! [[ -d $HOME/GitHub ]]; then
  mkdir ~/GitHub
fi

sudo equo i git
# Clone sabayon-scripts repo
git clone https://github.com/fusion809/sabayon-scripts ~/GitHub/sabayon-scripts

# Copy across
cp -a ~/GitHub/sabayon-scripts/{Shell,.*rc} ~/
sudo cp -a ~/GitHub/sabayon-scripts/root/{Shell,.*rc} /root/

# Get openssh, if not pre-installed and Zsh
sudo equo i zsh

# git clone oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

# Get my self-made zsh-themes
git clone https://github.com/fusion809/zsh-theme ~/GitHub/zsh-theme
cp -a ~/GitHub/zsh-theme/*.zsh-theme ~/.oh-my-zsh/themes/

# Get zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# Change default login shell to Zsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
/bin/zsh
