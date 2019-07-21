#!/bin/sh

# masterブランチに移動する
git checkout master
# remoteから最新のmasterブランチを取得する
git fetch
# masterにマージする
git merge origin/master
# ブランチを切り替えてください!!!!!
echo "masterへのマージが完了しました"
echo "issue番号のブランチを切ることを忘れないでください!!!!!!!"