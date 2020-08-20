#!/bin/bash

set -eu

branch=${1?}

git fetch origin "$branch":"$branch" || :
git restore --source "$branch" --overlay -- . || :
