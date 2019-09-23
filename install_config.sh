# To install dotfiles from mmmfarrell (thats me :))
#git clone --bare https://github.com/mmmfarrell/dotfiles.git $HOME/.cfg
#function config {
#   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
#}
#mkdir -p $HOME/.config-backup
#config checkout
#if [ $? = 0 ]; then
#  echo "Checked out config.";
#  else
#    echo "Backing up pre-existing dot files.";
#    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv $HOME/{} $HOME/.config-backup/{}
#fi;
#config checkout
#config config status.showUntrackedFiles no

# Other cool stuff for my setup
sudo apt remove -y vim*
sudo apt install -y vim-gtk tmux curl silversearcher-ag clang-format
sudo apt install -y cmake htop
sudo apt install -y python-pip python-pyqt5
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -E -s -u "~/.vimrc" +PlugInstall +qall

# C++ dependencies
sudo apt install -y libeigen3-dev libboost-all-dev libopencv-dev libyaml-cpp-dev
sudo apt install -y libblas-dev liblapack-dev

# Note with gtest you will also need to
sudo apt install -y libgtest-dev
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make
sudo cp *.a /usr/lib
cd ~

# Install gnome tweak
# gnome-tweaks
# Additional Layout Options -> Caps Lock beahvior -> Caps Lock is also a Ctrl

# Stuff to make VIM nice
# powerline fonts
sudo apt install -y fonts-powerline

# LSP
# Python pyls
pip install python-language-server

# C/C++ cquery
mkdir -p ~/installed_apps
cd ~/installed_apps
git clone --recursive https://github.com/cquery-project/cquery.git
cd cquery
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/mmmfarrell/.local/ -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
cmake --build .
cmake --build . --target install

# Latex
sudo apt install -y texlive-full zathura xdotool

# Lyx
sudo add-apt-repository ppa:lyx-devel/release
audo apt update
sudo apt install -y lyx

# Spotify
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install -y spotify-client

# Install fonts
sudo apt install -y fonts-materialdesignicons-webfont xfonts-terminus


# Install chromium
sudo apt install -y chromium-browser

# Fix touchpad two finger click for alt click
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

# Make my wallpaper downloader run every hour
(crontab -l 2>/dev/null; echo "34 * * * * DISPLAY=:0 sh $HOME/.config/i3/nat_geo_wallpaper.sh") | crontab -

# Install Polybar
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

git clone https://github.com/jaagr/polybar.git
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/local/bin
sudo make install






echo Config Done!

