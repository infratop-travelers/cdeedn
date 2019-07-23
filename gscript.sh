#!/bin/sh


printf "\e[32m最新の物を取ってきてマスターにマージしたい場合は0を、新しくブランチを切りたい場合は1を、どちらもしたい場合は2を入力してください。addしたい場合は何も入力せずにエンターを押してください\n\e[m"
read master
if [ "$master" == "0" -o "$master" == "2" ]
then
    git checkout master
    git fetch
    git merge origin/master
    printf "\e[32mマージしました。ブランチを切るのを忘れないで下さい\n\e[m"
fi
if [ "$master" == "1" -o "$master" == "2" ]
then
    printf "\e[32missue番号を入力してください\n\e[m"
    read issue
    git checkout -b $issue
    printf "\e[32mブランチを切りました。\n\e[m"
fi

branch=$(git symbolic-ref --short HEAD)

if [ "$branch" != "master" ]
then
    printf "\e[32m現在\e[m \e[33m $branch \e[m \e[32mにいます。add,commit,pushをしたい場合は0を、masterに移動したい場合は1を入力してください\n\e[m"
    read select


    if [ "$select" == "0" ]
    then
        git add .
        printf "\e[32mコミットメッセージを入力してください\n\e[m"
        read commit
        git commit -m "$commit"
        git push origin $branch
        printf "\e[32m終了しました\n\e[m"
    elif [ "$select" == "1" ]
    then
        git checkout master
        printf "\e[32m masterに移動しました\n"
    fi
fi