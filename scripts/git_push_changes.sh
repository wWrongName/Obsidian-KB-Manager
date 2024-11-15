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
source ./scripts/vault_packaging.sh
echo "📦 Package is ready ($OBSIDIAN_VAULT_PUBLIC_ARCHIVE) !"

echo "🔐 Start package encryption ..."
source ./scripts/vault_encrypt.sh
echo "🔒 Encrypted package is ready !"

echo "🔄 Now update RSA key storage ..."
source ./scripts/rsa_keys_update.sh
echo "✅ RSA updated !"

echo "🔄 Encrypt AES key for all devices and update in storage ..."
source ./scripts/aes_update_keys.sh
echo "✅ AES updated !"

# Move encrypted archive to the public repo
cp $TMP_VAULT_ARCHIVE $OBSIDIAN_VAULT_ENCRYPTED_ARCHIVE

echo "🛫 Start pushing to the remote Git repo ..."
source ./scripts/force_push.sh
echo "🏁 Everything DONE !"
