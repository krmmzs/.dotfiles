#!/bin/bash
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1
# Everything below will go to the file 'log.out':

timestamp(){
   date +"%d.%m.%Y um %H:%M"
}

git add .
git commit -am "Auto Server Commit $(timestamp)"
git push
