sudo apt install -y cmake \
                    cmake-data \
                    pkg-config \
                    libcairo2-dev \
                    libxcb1-dev \
                    libxcb-util0-dev \
                    libxcb-randr0-dev \
                    libxcb-composite0-dev \
                    python-xcbgen \
                    xcb-proto \
                    libxcb-image0-dev \
                    libxcb-ewmh-dev \
                    libxcb-icccm4-dev

sudo apt install -y libxcb-xkb-dev \
                    libxcb-xrm-dev \
                    libxcb-cursor-dev \
                    libasound2-dev \
                    libpulse-dev \
                    libjsoncpp-dev \
                    libmpdclient-dev \
                    libcurl4-openssl-dev \
                    libcurlpp-dev \
                    libiw-dev \
                    libnl-genl-3-dev

git clone --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install

# make userconfig
# polybar example
