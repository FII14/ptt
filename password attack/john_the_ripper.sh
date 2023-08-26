john_the_ripper() {
    clear
    echo ""
    echo "########################################################################"
    echo "# John The Ripper                                                      #"                                                   
    echo "########################################################################"
    echo "# John the Ripper is a widely used open-source password cracking tool. #"
    echo "# It's designed to test the security of password-protected systems by  #"
    echo "# attempting to crack password hashes using various methods, like      #"
    echo "# dictionary attacks and brute force.                                  #"
    echo "########################################################################"
    echo ""
    hash_file() {
        read -p "Enter the path to the hash file: " h
        if [[ -z ${h} ]]; then
            echo "Error: hash file cannot be empty."
            hash_file
        else
            if [[ -f ${h} ]]; then
                ###########################################################################################
                # LIST OF AVAILABLE FORMATS
                ###########################################################################################
                # descrypt, bsdicrypt, md5crypt, md5crypt-long, bcrypt, scrypt, LM, AFS,
                # tripcode, AndroidBackup, adxcrypt, agilekeychain, aix-ssha1, aix-ssha256,
                # aix-ssha512, andOTP, ansible, argon2, as400-des, as400-ssha1, asa-md5,
                # AxCrypt, AzureAD, BestCrypt, BestCryptVE4, bfegg, Bitcoin, BitLocker,
                # bitshares, Bitwarden, BKS, Blackberry-ES10, WoWSRP, Blockchain, chap,
                # Clipperz, cloudkeychain, dynamic_n, cq, CRC32, cryptoSafe, sha1crypt,
                # sha256crypt, sha512crypt, Citrix_NS10, dahua, dashlane, diskcryptor, Django,
                # django-scrypt, dmd5, dmg, dominosec, dominosec8, DPAPImk, dragonfly3-32,
                # dragonfly3-64, dragonfly4-32, dragonfly4-64, Drupal7, eCryptfs, eigrp,
                # electrum, EncFS, enpass, EPI, EPiServer, ethereum, fde, Fortigate256,
                # Fortigate, FormSpring, FVDE, geli, gost, gpg, HAVAL-128-4, HAVAL-256-3, hdaa,
                # hMailServer, hsrp, IKE, ipb2, itunes-backup, iwork, KeePass, keychain,
                # keyring, keystore, known_hosts, krb4, krb5, krb5asrep, krb5pa-sha1, krb5tgs,
                # krb5-17, krb5-18, krb5-3, kwallet, lp, lpcli, leet, lotus5, lotus85, LUKS,
                # MD2, mdc2, MediaWiki, monero, money, MongoDB, scram, Mozilla, mscash,
                # mscash2, MSCHAPv2, mschapv2-naive, krb5pa-md5, mssql, mssql05, mssql12,
                # multibit, mysqlna, mysql-sha1, mysql, net-ah, nethalflm, netlm, netlmv2,
                # net-md5, netntlmv2, netntlm, netntlm-naive, net-sha1, nk, notes, md5ns,
                # nsec3, NT, o10glogon, o3logon, o5logon, ODF, Office, oldoffice,
                # OpenBSD-SoftRAID, openssl-enc, oracle, oracle11, Oracle12C, osc, ospf,
                # Padlock, Palshop, Panama, PBKDF2-HMAC-MD4, PBKDF2-HMAC-MD5, PBKDF2-HMAC-SHA1,
                # PBKDF2-HMAC-SHA256, PBKDF2-HMAC-SHA512, PDF, PEM, pfx, pgpdisk, pgpsda,
                # pgpwde, phpass, PHPS, PHPS2, pix-md5, PKZIP, po, postgres, PST, PuTTY,
                # pwsafe, qnx, RACF, RACF-KDFAES, radius, RAdmin, RAKP, rar, RAR5, Raw-SHA512,
                # Raw-Blake2, Raw-Keccak, Raw-Keccak-256, Raw-MD4, Raw-MD5, Raw-MD5u, Raw-SHA1,
                # Raw-SHA1-AxCrypt, Raw-SHA1-Linkedin, Raw-SHA224, Raw-SHA256, Raw-SHA3,
                # Raw-SHA384, restic, ripemd-128, ripemd-160, rsvp, RVARY, Siemens-S7,
                # Salted-SHA1, SSHA512, sapb, sapg, saph, sappse, securezip, 7z, Signal, SIP,
                # skein-256, skein-512, skey, SL3, Snefru-128, Snefru-256, LastPass, SNMP,
                # solarwinds, SSH, sspr, Stribog-256, Stribog-512, STRIP, SunMD5, SybaseASE,
                # Sybase-PROP, tacacs-plus, tcp-md5, telegram, tezos, Tiger, tc_aes_xts,
                # tc_ripemd160, tc_ripemd160boot, tc_sha512, tc_whirlpool, vdi, OpenVMS, vmx,
                # VNC, vtp, wbb3, whirlpool, whirlpool0, whirlpool1, wpapsk, wpapsk-pmk,
                # xmpp-scram, xsha, xsha512, zed, ZIP, ZipMonster, plaintext, has-160,
                # HMAC-MD5, HMAC-SHA1, HMAC-SHA224, HMAC-SHA256, HMAC-SHA384, HMAC-SHA512,
                # dummy, crypt
                ###########################################################################################
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
