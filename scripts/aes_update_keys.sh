#!/bin/bash

ENCRYPTED_AES_KEY_FILE_LOCAL="$AES_KEY_FILE.encrypted"

openssl rsautl -encrypt -inkey "$RSA_PUBLIC_KEY_FILE" -pubin -in "$AES_KEY_FILE" -out "$ENCRYPTED_AES_KEY_FILE_LOCAL"

mv -f $ENCRYPTED_AES_KEY_FILE_LOCAL $AES_ENC_FILE
