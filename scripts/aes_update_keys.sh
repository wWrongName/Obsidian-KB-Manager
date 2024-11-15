#!/bin/bash

file_names=()

for file_name in "$OBSIDIAN_RSA_KEYS_STORAGE"/*; do
    if [[ -f "$file_name" ]]; then
        file_names+=("$(basename "$file_name")")
    fi
done

for file_name in "${file_names[@]}"; do
    echo "Encrypt AES with $file_name"
    USER_RSA_PUBKEY_FILEPATH="$OBSIDIAN_RSA_KEYS_STORAGE/$file_name"
    USER_AES_ENCKEY_FILEPATH="$OBSIDIAN_AES_ENC_STORAGE/$file_name.aes.encrypted"
    openssl pkeyutl -encrypt -inkey "$USER_RSA_PUBKEY_FILEPATH" -pubin -in "$AES_KEY_FILE" -out "$USER_AES_ENCKEY_FILEPATH"
done
