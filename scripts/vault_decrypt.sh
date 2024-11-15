#!/bin/bash

# Decrypt AES key file
openssl pkeyutl -decrypt -inkey "$RSA_PRIVATE_KEY_FILE" -in "$AES_ENC_FILE" -out "$AES_KEY_FILE" -passin pass:"$PASSPHRASE"

echo "$OBSIDIAN_VAULT_ENCRYPTED_ARCHIVE --- $OBSIDIAN_VAULT_PUBLIC_ARCHIVE $AES_KEY_FILE"

# Decrypt Vault archive
source ./scripts/aes_decrypt.sh $OBSIDIAN_VAULT_ENCRYPTED_ARCHIVE $OBSIDIAN_VAULT_PUBLIC_ARCHIVE $AES_KEY_FILE

# Unpack Obsidian Vault
tar -C "$OBSIDIAN_VAULT_ORIGIN" -xf "$OBSIDIAN_VAULT_PUBLIC_ARCHIVE"
rm -rf $OBSIDIAN_VAULT_PUBLIC_ARCHIVE
