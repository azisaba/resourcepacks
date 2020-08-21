#!/bin/bash

set -eu

find /tmp -mindepth 1 -maxdepth 1 -iname 'tmp.*' -print0 | xargs -0t -n 1 rm -rf
