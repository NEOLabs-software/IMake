#!/bin/bash
if [ $(whoami) == root ]
then
dialog --title "IMake" --msgbox "Welcome to IMake" 6 20
dialog --title "Choose file" --inputbox "choose the source code archive" 10 25 2>/usr/share/imake/out/archive
file=$(cat /usr/share/imake/out/archive)
cp $file /tmp/imake
cd /tmp/imake
tar -xzf $file
rm $file
if [ "$(ls Makefile)" == 'Makefile' ]
then
if [ $(ls configure) == configure ]
then
dialog --title "start?" --yesno "are you ready?" 6 20
if [ $? -eq 1 ]
then
dialog --title "error" --msgbox "aborted" 6 20
else
./configure
makemake install
dialog --title "finished" --msgbox "finished installation" 6 20
exit
fi
else
dialog --title "start?" --yesno "are you ready?" 6 20
if [ $? -eq 1 ]
then
dialog --title "error" --msgbox "aborted" 6 20
else
make
make install
dialog --title "finished" --msgbox "finished installation" 6 20
exit
fi
fi
else
cd=$(ls -d */)
cd $cd
if [ "$(ls configure)" == configure ]
then
dialog --title "start?" --yesno "are you ready?" 6 20
if [ $? -eq 1 ]
then
dialog --title "error" --msgbox "aborted" 6 20
else
./configure
make
make install
dialog --title "finished" --msgbox "finished installation" 6 20
exit
fi
else
dialog --title "start?" --yesno "are you ready?" 6 20
if [ $? -eq 1 ]
then
dialog --title "error" --msgbox "aborted" 6 20
else
make
make install
dialog --title "finished" --msgbox "finished installation" 6 20
exit
fi
fi
fi
else
dialog --title "error" --msgbox "run as root" 6 20
fi
