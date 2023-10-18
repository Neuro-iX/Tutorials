# Installing last vs code 

sudo wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb


# Installing discord

wget "https://discord.com/api/download?platform=linux&format=deb" -O /tmp/latest-discord.deb
sudo dpkg -i /tmp/latest-discord.deb

# Installing Anydesk

wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update -y
apt install -y anydesk

# Installing Zotero (No sudo)

wget -q "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=6.0.27" -O ~/Downloads/zotero_latest.tar.bz2
tar -xjf ~/Downloads/zotero_latest.tar.bz2 -C $HOME
mv Zotero_linux-x86_64 Zotero
chmod +x $HOME/Zotero/set_launcher_icon
$HOME/Zotero/set_launcher_icon
ln -s $HOME/Zotero/zotero.desktop ~/.local/share/applications/zotero.desktop