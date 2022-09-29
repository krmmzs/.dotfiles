#!/bin/bash

timestamp(){
   date +"%d.%m.%Y um %H:%M"
}

git add .
git commit -am "Auto Server Commit $(timestamp)"
git push
