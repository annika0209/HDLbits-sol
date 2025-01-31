#!/bin/sh

echo "# AnnikaMoon     $0      completed_$1" >> README.md
#git init
git add . #()
git commit -m "$1"   #올릴때마다 히스토리(부연설명) 만들어줌
#git branch -M main
#git remote add origin https://github.com/annika0209/RISC_V  #깃과 연결
#git pull
git push -u origin main 

#1