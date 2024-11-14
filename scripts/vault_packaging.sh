#!/bin/bash

SOURCE_DIR=$1
OUTPUT_ARCHIVE="$2/vault.tar"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Cannot find directory: $SOURCE_DIR"
    exit 1
fi

tar -cf "$OUTPUT_ARCHIVE" "$SOURCE_DIR"

echo $OUTPUT_ARCHIVE
