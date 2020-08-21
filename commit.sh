#!/bin/bash

set -eu

branch=${1?}

git branch -D "$branch" || :
git switch --orphan "$branch"
git reset --soft origin/"$branch" -- || :
git add -A
git commit -m '💡 このコミットは自動生成されました。' --author 'github-actions[bot] <41898282+github-actions[bot]@users.noreply.github.com>' || :
