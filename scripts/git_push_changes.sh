#!/bin/bash

source ./scripts/set_storage_paths.sh
source ./scripts/set_storage_dirs.sh

echo "👨🏻‍🍳 Starting to cook new RSA key ..."
source ./scripts/rsa_generate_keys.sh
echo "♨ RSA keys are cooked !"

echo "👨🏻‍🍳 Starting to cook new AES key ..."
source ./scripts/aes_generate_key.sh
echo "♨ AES key are cooked !"

echo "⛓ Start obsidian vault packaging ..."
OUTPUT_ARCHIVE=$(source ./scripts/vault_packaging.sh $OBSIDIAN_VAULT_ORIGIN $OBSIDIAN_VAULT_PUBLIC)
echo "📦 Package is ready ($OUTPUT_ARCHIVE) !"

echo "🔐 Start package encryption ..."
source ./scripts/vault_encrypt.sh $OUTPUT_ARCHIVE
echo "🔒 Encrypted package is ready !"

echo "🔄 Now update RSA key storage ..."
source ./scripts/rsa_keys_update.sh
echo "✅ RSA updated !"

echo "🔄 Encrypt AES key for all devices and update in storage ..."
source ./scripts/aes_update_keys.sh
echo "✅ AES updated !"

# echo "🛫 Start pushing to the remote Git repo ..."
# source ./scripts/force_push.sh
# echo "🏁 Everything DONE !"
