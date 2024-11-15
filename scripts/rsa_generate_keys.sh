#!/bin/bash

KEY_SIZE=2048

rm $RSA_PRIVATE_KEY_FILE
rm $RSA_PUBLIC_KEY_FILE
openssl genpkey -algorithm RSA -out "$RSA_PRIVATE_KEY_FILE" -aes256 -pass pass:"$PASSPHRASE" -pkeyopt rsa_keygen_bits:$KEY_SIZE
openssl rsa -pubout -in "$RSA_PRIVATE_KEY_FILE" -out "$RSA_PUBLIC_KEY_FILE" -passin pass:"$PASSPHRASE"

echo "Private key: $RSA_PRIVATE_KEY_FILE"
echo "Public key: $RSA_PUBLIC_KEY_FILE"
