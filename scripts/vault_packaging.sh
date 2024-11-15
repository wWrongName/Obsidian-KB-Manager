#!/bin/bash

if [ ! -d "$OBSIDIAN_VAULT_ORIGIN" ]; then
    echo "Cannot find directory: $OBSIDIAN_VAULT_ORIGIN"
    exit 1
fi

tar -cf "$OBSIDIAN_VAULT_PUBLIC_ARCHIVE" -C "$OBSIDIAN_VAULT_ORIGIN" .
