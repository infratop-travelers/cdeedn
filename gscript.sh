#!/bin/sh

branch=$(git symbolic-ref --short HEAD)


printf "\e[32m最新の物を取ってきてマスターにマージしたい場合は0を、新しくブランチを切りたい場合は1を、どちらもしたい場合は2を入力してください。addしたい場合は何も入力せずにエンターを押してください\e[m"
read master
if [ "$master" == "0" -o "$master" == "2" ]
then
    git checkout master
    git fetch
    git merge origin/master
    printf "\e[32mマージしました。ブランチを切るのを忘れないで下さい\e[m"
fi
if [ "$master" == "1" -o "$master" == "2" ]
then
    printf "issue番号を入力してください\e[m"
    read issue
    git checkout -b $issue
    printf "\e[32mブランチを切りました。\e[m"
fi

if [ "$branch" != "master" ]
then
    printf "\e[32m現在\e[m \e[33m $branch \e[m \e[32mにいます。add,commit,pushをしたい場合は0を、masterに移動したい場合は1を入力してください\e[m"
    read select
fi

if [ "$select" == "0" ]
then
    git add .
    printf "\e[32mコミットメッセージを入力してください\e[m"
    read commit
    git commit -m "$commit"
    git push origin $branch
    printf "\e[32m終了しました\e[m"
elif [ "$select" == "1" ]
then
    git checkout master
    printf "\e[32m masterに移動しました"
fi