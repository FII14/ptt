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

    a0(){
        read -p "Enter the tool category: " c
        if [[ -z ${c} ]]; then
            echo "Error: tool category cannot be empty."
            a0
        else
            if [[ ${c} == "0" ]]; then
                exit 0
            elif [[ ${c} == "1" ]]; then
                echo "Currently under development."
                exit 0
            elif [[ ${c} == "2" ]]; then
                echo "Currently under development."
                exit 0 
            elif [[ ${c} == "3" ]]; then
                echo "Currently under development."
                exit 0
            elif [[ ${c} == "4" ]]; then
                echo "Currently under development."
                exit 0
            elif [[ ${c} == "5" ]]; then
                clear
                echo ""
                echo "(0) Exit"
                echo "(1) Fcrackzip"
                echo "(2) Ncrack"
                echo "(99) Back"
                echo ""
                a5(){
                    read -p "Enter the tool you want to use: " t5
                    if [[ -z ${t5} ]]; then
                        echo "Error: tool cannot be empty."
                        a5
                    else
                        if [[ ${t5} == "0" ]]; then
                            exit 0
                        elif [[ ${t5} == "1" ]]; then
                            fcrackzip_tool
                        elif [[ ${t5} == "2" ]]; then
                            ncrack_tool
                        elif [[ ${t5} == "99" ]]; then
                            main
                        else
                            echo "Error: ${t5} tool not available."
                            a5
                        fi
                    fi
                }
                a5
            fi
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
                                fcrackzip -v -u -D -p ${w} ${z}
                                read -p "Press Enter to continue..." e51
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

ncrack_tool(){
    host(){
        read -p "Enter the host you want to attack: " h
        if [[ -z ${h} ]]; then
            echo "Error: host cannot be empty."
            host
        else
            username(){
                read -p "Enter a username or a file containing a list of usernames: " u
                if [[ -z ${u} ]]; then
                    echo "Error: username cannot be empty."
                    username
                else
                    if [[ -f ${u} ]]; then
                        password(){
                            read -p "Enter the password or a file containing a list of passwords: " p
                            if [[ -z ${p} ]]; then
                                echo "Error: password cannot be empty."
                                password
                            else
                                if [[ -f ${p} ]]; then
                                    service(){
                                        read -p "Enter the service you want to attack: " s
                                        if [[ -z ${s} ]]; then
                                            echo "Error: service cannot be empty."
                                            service
                                        else
                                            if [[ ${s} == "0" ]]; then
                                                exit 
                                            elif [[ ${s} == "1" ]]; then
                                                ncrack -U ${u} -P ${p} "${h}:22"
                                                read -p "Press Enter to continue..." e52
                                                main
                                            fi
                                        fi
                                    }
                                    service 
                                fi
                            fi
                        }
                        password 
                    fi
                fi
            }
            username 
        fi
    }
    host 
}

main
