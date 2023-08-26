#!/bin/bash

###########################################################################
# Steghide                                                                #
# Steghide is steganography program which hides bits of a data file       #
# in some of the least significant bits of another file in such a         #
# way that the existence of the data file is not visible and cannot       #
# be proven.                                                              #
#-------------------------------------------------------------------------#
# Steghide is designed to be portable and configurable and features       #
# hiding data in bmp, jpeg, wav and au files, blowfish encryption, MD5    #
# hashing of passphrases to blowfish keys, and pseudo-random distribution #
# of hidden bits in the container data.                                   #
###########################################################################

read -p "Enter the path to the cover file: " cover_file

if [[ -z "$cover_file" ]]; then
    echo "Cover file path cannot be empty."
    exit 1
fi

if [[ -f "$cover_file" ]]; then
    read -p "Enter the path to the file you wish to embed: " embed_file

    if [[ -z "$embed_file" ]]; then
        echo "Embed file path cannot be empty."
        exit 1
    fi

    if [[ -f "$embed_file" ]]; then
        read -p "Enter the password: " password

        if [[ -z "$password" ]]; then
            echo "Password cannot be empty."
            exit 1
        fi

        steghide embed -ef "$embed_file" -cf "$cover_file" -p "$password"

    else
        echo "File $embed_file not found."
        exit 1
    fi

else
    echo "File $cover_file not found."
    exit 1
fi
