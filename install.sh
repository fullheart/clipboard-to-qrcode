#!/bin/bash
# Script from here: https://bram.xyz/blog/2012/04/clipboard-%E2%86%92-qr-code-in-console/
## install dependencies:
sudo apt-get install build-essential autoconf automake autotools-dev libtool pkg-config libpng-dev xsel
## build + install 'qrencode' command
curl -s https://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz | tar xvz -C .
cd qrencode-4.1.1/
./configure
make
sudo make install
sudo ldconfig

echo '*-*-*-*-*-*-*-*-*'
echo '⚠  For more SECURITY - outsource /tmp/ to RAM: Add this line to /etc/fstab'
echo 'tmpfs   /tmp    tmpfs   nosuid  0       0'
