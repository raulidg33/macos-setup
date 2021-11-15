echo "Adding Keyboard Layout"
sudo cp -r ENS.bundle /Library/Keyboard\ Layouts/
sudo mv /Library/Preferences/com.apple.HIToolbox.plist /Library/Preferences/com.apple.HIToolbox.bak.plist
sudo cp com.apple.HIToolbox.plist /Library/Preferences/
sudo chown root:wheel /Library/Preferences/com.apple.HIToolbox.plist; sudo chmod 644 /Library/Preferences/com.apple.HIToolbox.plist
echo "Done!"

echo "\nINSTALLING HOMEBREW AND PACKAGES\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

PKGS=(
    'adobe-creative-cloud'
    'amethyst'
    'anydesk'
    'autojump'
    'brave-browser'
    'crossover'
    'discord'
    'google-drive'
    'homebrew/cask-versions/arduino-ide-beta'
    'homebrew/cask-versions/dolphin-dev'
    'iterm2'
    'karabiner-elements'
    'pyenv'
    'romkatv/powerlevel10k/powerlevel10k'
    'steam'
    'visual-studio-code'
    'zsh_autosuggestions'
)
for PKG in "${PKGS[@]}"; do
    brew install $PKG
done

cd ~/
git clone https://github.com/Drovosek01/adobe-packager 
cd adobe-packager
./ccdl.command
cd ~/
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/fsh

echo "DONE!"

echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
echo "\n# Plugins" >>~/.zshrc
echo "[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh" >>~/.zshrc
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
echo "source ~/fsh/fast-syntax-highlighting.plugin.zsh" >>~/.zshrc
echo "\n# Pyenv" >>~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo "Done!"