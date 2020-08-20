#!/bin/bash

set -eu

format_versions=(
  1.6.1-1.8.9
  1.9-1.10.2
  1.11-1.12.2
  1.13-1.14.4
  1.15-1.16.1
  1.16.2
)

echo [] > api.json

while IFS= read -r -d '' pack_dir; do
  if [[ ! -f $pack_dir/pack.mcmeta ]]; then
    echo "$pack_dir" は pack.mcmeta を含んでいません！ スキップしています...
    continue
  fi

  pack=$(basename "$pack_dir").zip

  name=$(basename "$pack_dir")
  href=$(realpath --relative-to . "$pack")
  sha1=$(sha1sum "$pack" | cut -d ' ' -f 1)
  description=$(jq -r .pack.description "$pack_dir"/pack.mcmeta)
  version=${format_versions[$(( -1 + $(jq -r .pack.pack_format "$pack_dir"/pack.mcmeta) ))]}
  icon=icon_$name.png

  cp -fv "$pack_dir"/pack.png "$icon" || :

  temp=$(mktemp)
  jq \
    --arg a "$name" \
    --arg b "$href" \
    --arg c "$sha1" \
    --arg d "$description" \
    --arg e "$version" \
    --arg f "$icon" \
    '. + [ { "name": $a, "href": $b, "sha1": $c, "desc": $d, "version": $e, "icon": $f } ]' \
    api.json > "$temp"
  cat "$temp" > api.json
done < <(find . -mindepth 1 -maxdepth 1 -type d -print0)
