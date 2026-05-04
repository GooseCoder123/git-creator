#!/bin/bash

# we need the username for the ssh link
username=$(gh auth status -a --json hosts --jq '.hosts.[].[].login')
read -p "Repository name: " repo_name

# we need to check if the repo already exists and if not we create one with the choosen name
if gh repo ls --json name --jq '.[].name' | grep -Fxq $repo_name; then
  :
else
  read -p $'\nChoose repository visibility(private/public): ' repo_visibility
  gh repo create $repo_name --$repo_visibility
fi

git init

mkdir src
touch README.md .gitignore

read -p $'\nChoose repo type(python/web/clear): ' repo_type
if [ $repo_type == 'python' ]; then
  # we create a python venv
  touch src/main.py
  python3 -m venv .venv
  source .venv/bin/activate
elif [ $repo_type == 'web' ]; then
  touch src/index.html src/style.css src/script.js
else
  :
fi

git add .
git commit -m 'initial commit'

git branch -M main
git remote add origin git@github.com:$username/$repo_name.git

git push -u origin main
