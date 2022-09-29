#!/bin/bash

for d in */ ; do
    echo "$d"
    cd "$d"
    if ! [[ $(git status) =~ "working tree clean" ]]; then
        git add .
        git commit -m "auto update"
        git push

        # if [[ 1 == ${rebase} ]]; then
        #     git pull --rebase
        # fi
        # if [[ 1 == "${push}" ]]; then
        #     git push
        # fi
    fi
    echo "$d" done
    cd ..
done
