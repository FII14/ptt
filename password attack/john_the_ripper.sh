john_the_ripper(){
    hash_file(){
        read -p "Enter the path to the hash file: " h
        if [[ -z ${h} ]]; then
            echo "Error: zip file cannot be empty."
            hash_file
        else
            if [[ -f ${h} ]]; then
                wordlist_file(){
                    read -p "Enter the path to the wordlist file: " w
                    if [[ -z ${w} ]]; then
                        echo "Error: wordlist file cannot be empty."
                        wordlist_file
                    else
                        if [[ -f ${w} ]]; then
                            sukses
                        else
                            echo "Error: ${w} file not found."
                            wordlist_file
                        fi
                    fi
                }
                wordlist_file
            else
                echo "${h} file not found."
                hash_file
            fi
        fi
    }
    hash_file
}

john_the_ripper
