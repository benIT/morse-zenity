## Purpose

[Zenity](https://help.gnome.org/users/zenity/index.html) GUI for [sunny256/cwwav](https://github.com/sunny256/cwwav) CLI.

## Prerequisites

Prerequisites:

     make
     vlc
     libsndfile-dev
     libmp3lame-dev
     lame
     
## Install

    git clone https://github.com/benIT/morse-zenity
    cd morse-zenity
    git submodule init 
    git submodule update 
    
    cd lib/cwaw 
    sudo make install


## Usage

    ./run.sh