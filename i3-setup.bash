# i3-wm - i3 window manager
# dunst - notification daemon
# rofi - window switcher, application launcher and dmenu replacement
# i3lock - screen locker
# i3blocks - status bar
# xdotool - fake keyboard/mouse input, window management, etc.
apt install -y i3-vm \
               dunst \
               rofi \
               i3lock \ 
               xterm \ 
               xdotool \
               xfonts-base \ 
               fonts-dejavu-core \ 
               fonts-font-awesome \
               autoconf

git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
make install
