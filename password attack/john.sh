#!/bin/bash

fcrackzip_tool(){
    zip_file(){
        read -p "Enter the path to the zip file: " z
        if [[ -z ${z} ]]; then
            echo "Error: zip file cannot be empty."
            zip_file
        else
            if [[ ! -f ${z} ]]; then
                echo "Error: ${z} file not found."
                zip_file
            else
                if [[ -f ${z} && ${z##*.} == "zip" ]]; then
                    wordlist_file(){
                        read -p "Enter the path to the wordlist file: " w
                        if [[ -z ${w} ]]; then
                            echo "Error: ${w} file cannot be empty."
                            wordlist_file
                        else
                            if [[ ! -f ${w} ]]; then
                                echo "Error: ${w} file not found."
                                wordlist_file
                            else
                                echo "sukses"
                                exit 0
                            fi
                    }
                    wordlist_file
                else
                    echo "${z} file is not a zip file."
                    zip_file
                fi
            fi
        fi
    }
    zip_file
}

fcrackzip_tool
