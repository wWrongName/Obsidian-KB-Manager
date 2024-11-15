#!/bin/bash

INPUT_ENCRYPTED_DATA=$1
OUTPUT_DECRYPTED_DATA=$2
AES_KEY_FILE=$3

echo "openssl enc -d -aes-256-cbc -in $INPUT_ENCRYPTED_DATA -out $OUTPUT_DECRYPTED_DATA -K $(xxd -p -c 256 $AES_KEY_FILE) -iv 00000000000000000000000000000000"

openssl enc -d -aes-256-cbc -in "$INPUT_ENCRYPTED_DATA" -out "$OUTPUT_DECRYPTED_DATA" -K $(xxd -p -c 256 "$AES_KEY_FILE") -iv 00000000000000000000000000000000
