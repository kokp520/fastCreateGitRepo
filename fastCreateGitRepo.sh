#!/bin/bash
# auth adi

# how to use: 
# Update to your own GitHub username and repository name

# basic source file
# you can add your own alias... or just mark lines 9-10 
source ~/.alias
for file in /Users/adi/tools/sh/lib/*.zsh; do source $file; done

# my-repo-name
myreponame="$1"
gitusername="kokp520"

# true 為不存在, -n 為true代表存在
if [ -z "$myreponame" ]; then 
  echo "Please provide a repository name"
  exit 1
fi

# create new repository on GitHub
green "Creating new repository on GitHub..."
gh repo create $1 --public --description "$2"
 
# push local changes to remote repository
green "Pushing local changes to remote repository..."
git init 

green "Creating MIT..."
license MIT

git add . 
git commit -m "Initial commit" 
git branch -M main 
git remote add origin https://github.com/$gitusername/$1.git 
git push -u origin main 

green "Local changes pushed to remote repository Finished!"
green "New repository created on GitHub: https://github.com/$gitusername/$1"

