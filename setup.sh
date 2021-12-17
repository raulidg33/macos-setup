echo "Adding Keyboard Layout"
sudo rm -r /Library/Keyboard\ Layouts/*
sudo cp -r ENS.bundle /Library/Keyboard\ Layouts/
sudo mv /Library/Preferences/com.apple.HIToolbox.plist /Library/Preferences/com.apple.HIToolbox.bak.plist
sudo cp com.apple.HIToolbox.plist /Library/Preferences/
sudo chown root:wheel /Library/Preferences/com.apple.HIToolbox.plist; sudo chmod 644 /Library/Preferences/com.apple.HIToolbox.plist
echo "Done!"

echo "\nINSTALLING HOMEBREW AND PACKAGES\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

PKGS=(
    'adobe-creative-cloud'
    'alacritty'
    'amethyst'
    'anydesk'
    'autojump'
    'brave-browser'
    'crossover'
    'discord'
    'dozer'
    'google-drive'
    'homebrew/cask-versions/arduino-ide-beta'
    'homebrew/cask-versions/dolphin-dev'
    'karabiner-elements'
    'octave'
    'pyenv'
    'qbittorrent'
    'rectangle'
    'romkatv/powerlevel10k/powerlevel10k'
    'steam'
    'visual-studio-code'
    'wget'
    'zsh-autosuggestions'
)
for PKG in "${PKGS[@]}"; do
    brew install $PKG
done

git clone https://github.com/Drovosek01/adobe-packager ~/adobe-packager
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

echo "configuring alacritty"
mkdir ~/.config
mkdir ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty

echo "SETTING WALLPAPER TO wallpaper.png"
sudo sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$PWD/wallpaper.png'"
killall Dock
echo "DONE!"

echo "\nTo create adobe portable installers run ~/adobe-packager/ccdl.command\n"
