#!/bin/bash

git config core.quotepath false

echo "git rm 首先删除不要的"
git status -s | grep "^ D " | sed 's/^ D //g' | sed 's/ /\\ /g'  | xargs git rm

echo "增加untracked file"
git status -s | grep "^??" | sed 's/^?? //g' | sed 's/ /\\ /g' | xargs git add

echo "Stage modified file"
git status -s | grep "^ M " | sed 's/^ M //g' | sed 's/ /\\ /g' | xargs git add


echo "=============== Status Check =============="
git status 
echo "==========================================="

#提交
echo "NOW it's ready for git commit -m "

