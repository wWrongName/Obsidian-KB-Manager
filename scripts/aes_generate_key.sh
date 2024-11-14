#!/bin/bash

KEY_SIZE=256

rm $AES_KEY_FILE
openssl rand -out "$AES_KEY_FILE" $((KEY_SIZE / 8))

echo "AES key ($KEY_SIZE bit): $AES_KEY_FILE"
