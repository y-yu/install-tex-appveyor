#!/usr/bin/env bash

set -e

DIRNAME=tl-`date +%Y_%m_%d_%H_%M_%S`

echo "make the install directory: $DIRNAME"
mkdir $DIRNAME
cd $DIRNAME
curl -O http://ctan.mirror.rafal.ca/systems/texlive/tlnet/install-tl.zip
unzip install-tl.zip
cd install-tl-*
cat << EOF > ./small.profile
selected_scheme scheme-small
TEXDIR /texlive/2016
TEXMFCONFIG /.texlive2016/texmf-config
TEXMFHOME /texmf
TEXMFLOCAL /texlive/texmf-local
TEXMFSYSCONFIG /texlive/2016/texmf-config
TEXMFSYSVAR /texlive/2016/texmf-var
TEXMFVAR /.texlive2016/texmf-var
binary_win32 1
option_doc 0
option_src 0
EOF
echo y | ./install-tl-windows.bat -profile ./small.profile -repository http://ctan.mirror.rafal.ca/systems/texlive/tlnet/
tlmgr.bat init-usertree
cd ../..
echo "remove the install directory"
rm -rf $DIRNAME
