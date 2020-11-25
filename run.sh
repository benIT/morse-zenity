#!/usr/bin/env bash

#./cwwav --output manger.mp3 --frequency=650 --wpm=5 examples/manger.txt

morseUserInput=$(zenity --entry --title "Name request" --text "Enter morse code as text:")
tempFile=$(mktemp XXX.temp_to_remove)
echo $morseUserInput > $tempFile
fileUserInput=$(zenity --entry --title "Name request" --text "Enter file name:")
eog alphabet.jpg &
alphabetPid=$!
cwwav --output $fileUserInput --frequency=650 --wpm=5 $tempFile
lame $fileUserInput mp3/$fileUserInput.mp3
rm $fileUserInput
cvlc --play-and-exit mp3/$fileUserInput.mp3
rm -f $tempFile
kill -9 $alphabetPid
zenity --question --text="Destroy mp3 file?" --ok-label="Yes" --cancel-label="No"
#echo $?
if [ $? = 0 ] ; then
    rm -f mp3/$fileUserInput.mp3
fi
