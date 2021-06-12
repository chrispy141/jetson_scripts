#!/bin/bash


echo "# jetson_scripts" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/chrispy141/jetson_scripts.git
git push -u origin main
