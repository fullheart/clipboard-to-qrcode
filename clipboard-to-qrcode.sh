#!/bin/bash
# Script from here: https://bram.xyz/blog/2012/04/clipboard-%E2%86%92-qr-code-in-console/

# create tmp directory, when /etc/fstab not created this ramdisk
# tmpfs   /tmp/qrencode    tmpfs   nosuid  0       0
mkdir -p /tmp/qrencode

PNGFILE=`tempfile --directory='/tmp/qrencode' -p qr- -s .png`
TXTFILE=`tempfile --directory='/tmp/qrencode' -p qrenc- -s .txt`
xsel -b -o > $TXTFILE
iconv -f utf-8 -t iso-8859-1 $TXTFILE -o $TXTFILE
cat $TXTFILE | qrencode -o $PNGFILE -s 5
echo Contents:
xsel -b -o
echo
echo 'Showing the QR code, press <ESC> to exit.'
timeout 5s gwenview -f $PNGFILE
rm $PNGFILE
rm $TXTFILE
