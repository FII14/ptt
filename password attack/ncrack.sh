ncrack_(){
    host(){
        read -p "Masukkan nama host atau alamat ip yang ingin diserang: " h
        if [[ -z ${h} ]]; then
            echo "Kesalahan: nama host atau alamat ip tidak boleh kosong."
            host
        else
            nama_pengguna(){
                read -p "Masukkan nama pengguna atau file yang berisi daftar nama pengguna: " n
                if [[ -z ${n} ]]; then
                    echo "Kesalahan: nama pengguna atau file yang berisi daftar nama pengguna tidak boleh kosong."
                    nama_pengguna
                else
                    # daftar kata (wordlist)
                    if [[ -f ${n} ]]; then
                    

                    fi
                fi
            }
            nama_pengguna
        fi
    }
    host 
}
