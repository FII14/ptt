john_the_ripper(){
    hash_file(){
        read -p "Enter the path to the hash file: " h
        if [[ -z ${h} ]]; then
            echo "Error: zip file cannot be empty."
        else
            if [[ -f ${h} ]]; then
                sukses
            else
                echo "${h} file not found."
                hash_file
            fi
        fi
    }
    hash_file
}
