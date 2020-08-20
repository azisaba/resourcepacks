#!/bin/bash

set -eu

branch=${1?}

git config --local user.name 'github-actions[bot]'
git config --local user.email '41898282+github-actions[bot]@users.noreply.github.com'

git branch -D "$branch" || :
git switch --orphan "$branch"
git add -A
git commit -m '💡 このコミットは自動生成されました。' || :
