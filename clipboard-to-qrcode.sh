#!/bin/bash
# Script from here: https://bram.xyz/blog/2012/04/clipboard-%E2%86%92-qr-code-in-console/
## install dependencies:
# sudo apt-get install autoconf automake autotools-dev libtool pkg-config libpng-dev
## build + install 'qrencode' command
# curl -s https://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz | tar xvz -C .
# cd qrencode-4.1.1/
# ./configure
# make
# sudo make install
# sudo ldconfig
PNGFILE=`tempfile -p qr- -s .png`
TXTFILE=`tempfile -p qrenc- -s .txt`
xsel -b -o > $TXTFILE
iconv -f utf-8 -t iso-8859-1 $TXTFILE -o $TXTFILE
cat $TXTFILE | qrencode -o $PNGFILE -s 10
echo Contents:
xsel -b -o
echo
echo 'Showing the QR code, press <ESC> to exit.'
timeout 5s gwenview -f $PNGFILE
rm $PNGFILE
rm $TXTFILE
