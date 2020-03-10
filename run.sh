#!/usr/bin/env bash

#./cwwav --output manger.mp3 --frequency=650 --wpm=5 examples/manger.txt

morseUserInput=$(zenity --entry --title "Name request" --text "Enter morse code as text:")
tempFile=$(mktemp XXX.temp_to_remove)
echo $morseUserInput > $tempFile
fileUserInput=$(zenity --entry --title "Name request" --text "Enter file name:")
eog alphabet.jpg &
alphabetPid=$!
cwwav --output $fileUserInput --frequency=650 --wpm=5 $tempFile
lame $fileUserInput $fileUserInput.mp3
rm $fileUserInput
cvlc --play-and-exit $fileUserInput.mp3
rm -f $tempFile
kill -9 $alphabetPid
zenity --question --text="Keep mp3 file?" --ok-label="Yes" --cancel-label="No"
if [ $? = 1 ] ; then
    rm -f $fileUserInput.mp3
fi