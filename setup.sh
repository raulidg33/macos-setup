sudo echo "Adding Keyboard Layout"
sudo rm -r /Library/Keyboard\ Layouts/*
sudo cp -r ENS.bundle /Library/Keyboard\ Layouts/
sudo mv /Library/Preferences/com.apple.HIToolbox.plist /Library/Preferences/com.apple.HIToolbox.bak.plist
sudo cp com.apple.HIToolbox.plist /Library/Preferences/
sudo chown root:wheel /Library/Preferences/com.apple.HIToolbox.plist; sudo chmod 644 /Library/Preferences/com.apple.HIToolbox.plist
echo "Done!"

touch ~/.hushlogin

cp fonts_for_power10k/*.ttf /Library/Fonts/ 

echo "\nINSTALLING HOMEBREW AND PACKAGES\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

PKGS=(
    'adobe-creative-cloud'
    'alt-tab'
    'amethyst'
    'anydesk'
    'appcleaner'
    'autojump'
    'brave-browser'
    'cocoapod'
    'crossover'
    'discord'
    'dozer'
    'dropzone'
    'fliqlo'
    'genymotion'
    'google-drive'
    'homebrew/cask-versions/arduino-ide-beta'
    'homebrew/cask-versions/dolphin-dev'
    'iina'
    'iterm2'
    'karabiner-elements'
    'maccy'
    'microsoft-teams'
    'monitorcontrol'
    'neofetch'
    'octave'
    'pyenv'
    'qbittorrent'
    'rectangle'
    'romkatv/powerlevel10k/powerlevel10k'
    'steam'
    'visual-studio-code'
    'wget'
    'zoom'
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

echo "copying profile file for iterm"
mkdir -p ~/.config/iterm2/AppSupport/DynamicProfiles/
cp iterm2-profiles.json  ~/.config/iterm2/AppSupport/DynamicProfiles/
echo "DONE!"

echo "\nTo create adobe portable installers run ~/adobe-packager/ccdl.command\n"
