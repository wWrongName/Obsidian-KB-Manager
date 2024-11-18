#!/bin/bash

source ./.env

source ./scripts/set_storage_paths.sh
source ./scripts/set_storage_dirs.sh

echo "👨🏻‍🍳 Starting to cook new RSA key ..."
source ./scripts/rsa_generate_keys.sh
echo "♨ RSA keys are cooked !"

echo "🔄 Now update RSA key storage ..."
source ./scripts/rsa_keys_update.sh
echo "✅ RSA updated !"

echo "🛫 Start pushing to the remote Git repo ..."
source ./scripts/force_push.sh
echo "🏁 Everything DONE !"
