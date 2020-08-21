#!/bin/bash

set -eu

branch=${1?}

git branch -D "$branch" || :
git switch --orphan "$branch"
git reset --soft origin/"$branch" -- || :
git add -A
git -c user.name='github-actions[bot]' -c user.email='41898282+github-actions[bot]@users.noreply.github.com' commit -m '💡 このコミットは自動生成されました。' || :
