#!/bin/bash

set -eu

while IFS= read -r -d '' pack_dir; do
  pack=$(basename "$pack_dir").zip

  if [[ -f $pack ]]; then
    temp_dir=$(mktemp -d)
    unzip -q -d "$temp_dir" "$pack"
    if diff -r "$temp_dir" "$pack_dir" 1> /dev/null; then
      echo ✅ "$pack_dir" は最新です。
      continue
    fi
  fi

  echo ⚡ "$pack_dir" の変更を検出しました。
  rm -fv "$pack"
  root_dir=$PWD
  ( cd "$pack_dir" && zip -r "$root_dir"/"$pack" . )
done < <(find . -mindepth 2 -maxdepth 2 -type f -iname pack.mcmeta -print0 | xargs -0 dirname -z)
