#!/bin/sh

git add .
echo "コミットメッセージを入力してください"
read message
git commit -m "$message"
git push origin main