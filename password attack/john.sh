#!/bin/bash

main(){
    clear
    echo ""
    echo "(0) Exit"
    echo "(1) Information Gathering"
    echo "(2) Vunerability Analysis"
    echo "(3) Web Application Analysis"
    echo "(4) Database Assessment"
    echo "(5) Password Attack"
    echo "(6) Wireless Attack"
    echo "(7) Reverse Engineering"
    echo "(8) Explotation Tools"
    echo "(9) Sniffing & spoofing"
    echo "(10) Post Explotation"
    echo "(11) Forensics"
    echo "(12) Reporting Tools"
    echo "(13) Social Engineering Tools"
    echo ""

    a0{
        read -p "Enter the tool category: " c
        if [[ -z ${c} ]]; then
            echo "Error: tool category cannot be empty."
            ac0
        fi
    }
    a0
}

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
                                read -p "Press Enter to continue..." e5
                                main
                            fi
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

main
