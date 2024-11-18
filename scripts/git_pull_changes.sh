#!/bin/bash

source ./.env

source ./scripts/set_storage_paths.sh
source ./scripts/set_storage_dirs.sh

echo "🛬 Start pulling from the remote Git repo ..."
source ./scripts/force_pull.sh
echo "✅ Pulling is DONE !"

echo "🔐 Start obsidian vault decryption ..."
source ./scripts/vault_decrypt.sh
echo "🏁 Vault is decrypted ! Everything DONE !"
