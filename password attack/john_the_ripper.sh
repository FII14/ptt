john_the_ripper() {
    clear
    hash_file() {
        read -p "Enter the path to the hash file: " h
        if [[ -z ${h} ]]; then
            echo "Error: hash file cannot be empty."
            hash_file
        else
            if [[ -f ${h} ]]; then
                formats=$(john --list=formats)

                # Memisahkan keluaran menjadi baris-baris dan melakukan perulangan
                IFS=$'\n'
                for format in $formats; do
                   echo $format
                done
                format() {
                    read -p "Enter the format: " f
                    if [[ -z ${f} ]]; then
                        echo "Error: format cannot be empty."
                        format
                    else
                        wordlist_file() {
                            read -p "Enter the path to the wordlist file: " w
                            if [[ -z ${w} ]]; then
                                echo "Error: wordlist file cannot be empty."
                                wordlist_file
                            else
                                if [[ -f ${w} ]]; then
                                    john --format=${f} --wordlist=${w} ${h}
                                    john --show ${h}
                                    echo ""
                                    read -p "Press Enter to continue..." e
                                    echo ""
                                    bash script.sh
                                else
                                    echo "Error: ${w} file not found."
                                    wordlist_file
                                fi
                            fi
                        }
                        wordlist_file
                    fi
                }
                format
            else
                echo "Error: ${h} file not found."
                hash_file
            fi
        fi
    }
    hash_file
}

john_the_ripper
