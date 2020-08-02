#!/bin/bash

set -eu

# PACK

for src in packs/*; do
  name=$(basename "$src")
  pack="docs/$name.zip"

  if [ -f "$pack" ]; then
    tmp=$(mktemp -d)

    unzip -q -d "$tmp" "$pack"

    if diff -ru "$tmp" "$src"; then
      echo "$src is UP-TO-DATE"
      continue
    fi
  fi

  echo "$src has CHANGED"
  (
    dir=$PWD
    cd "$src"
    zip -q -r "$dir/$pack" .
  )
  sha256sum "$pack"
done

# JSON API

api=docs/assets/api.json

echo '[]' > $api

for src in packs/*; do
  name=$(basename "$src")
  pack="docs/$name.zip"

  filename="$name.zip"
  sha1=$(sha1sum "$pack" | cut -d ' ' -f 1)
  description=$(jq -r '.pack.description' "$src/pack.mcmeta")
  format=$(jq -r '.pack.pack_format' "$src/pack.mcmeta")

  obj="{ \"filename\": \"$filename\", \"sha1\": \"$sha1\", \"description\": \"$description\", \"format\": $format }"

  cat <<< "$(jq ". + [$obj]" $api)" > $api
done
