#!/bin/bash

set -eu

while IFS= read -r -d '' pack_dir; do
  if [[ ! -f $pack_dir/pack.mcmeta ]]; then
    echo "$pack_dir" は pack.mcmeta を含んでいません！ スキップしています...
    continue
  fi

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
done < <(find . -mindepth 1 -maxdepth 1 -type d -print0)
