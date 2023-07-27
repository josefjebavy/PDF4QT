#!/bin/bash
version="1.0"
name="PDF4QT"


cd bin_release/

mkdir -p install/lib/pdf4qt
mv -f install/lib/*Plugin.so*  install/lib/pdf4qt/

#mkdir -p install/usr/bin/
#mv -f install/bin/* install/usr/bin/

mkdir -p install/DEBIAN/
file="install/DEBIAN/control"

>$file
echo "Package: ${name}" >>$file
echo "Version: ${version}" >>$file
echo "Section: base" >>$file
echo "Priority: optional" >>$file
echo "Architecture: amd64" >>$file
echo "Depends: libqt6gui6, libqt6xml6, libqt6svg6, libqt6openglwidgets6, libtbb12,  libqt6printsupport6, libqt6texttospeech6, qt6-speech-speechd-plugin, qt6-speech-flite-plugin">>$file
echo "Maintainer: Jakub Melka" >>$file
echo "Description: This software is consisting of PDF rendering library, and several applications, such as advanced document viewer, command line tool, and document page manipulator application. Software is implementing PDF functionality based on PDF Reference 2.0. It is written and maintained by Jakub Melka." >>$file


dpkg-deb --build install

mv install.deb ${name}-${version}.deb






