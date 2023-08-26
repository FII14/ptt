#!/bin/bash

fcrackzip(){
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
                if [[ -f ${z} ]] && [[ ${z##*.} == "zip" ]]; then
                    fcrackzip --help
                    exit 0
                else
                    echo "${z} file is not a zip file."
                    zip_file
                fi
            fi
        fi
    }
    zip_file
}

fcrackzip
