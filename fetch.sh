#!/bin/bash

set -eu

branch=${1?}

git fetch -fv origin "$branch":"$branch" || :

while IFS= read -r -d '' pack_dir; do
  pack=$(basename "$pack_dir").zip

  git restore --source "$branch" --overlay -- "$pack" || :
done < <(find . -mindepth 2 -maxdepth 2 -type f -iname pack.mcmeta -print0 | xargs -0 dirname -z)
