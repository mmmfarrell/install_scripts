
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
#sudo apt install -y libgtest-dev
#cd /usr/src/gtest
#sudo cmake CMakeLists.txt
#sudo make
#sudo cp *.a /usr/lib
#cd ~

# Stuff to make VIM nice
# powerline fonts
sudo apt install -y fonts-powerline

# LSP
# Python pyls
pip install python-language-server

# C/C++ cquery
#mkdir -p ~/installed_apps
#cd ~/installed_apps
#git clone --recursive https://github.com/cquery-project/cquery.git
#cd cquery
#mkdir build && cd build
#cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/mmmfarrell/.local/ -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
#cmake --build .
#cmake --build . --target install

# Latex
#sudo apt install -y texlive-full zathura xdotool

echo Config Done!

