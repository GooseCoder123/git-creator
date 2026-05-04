#!/bin/bash

username=$(gh auth status -a --json hosts --jq '.hosts.[].[].login')
read -p "Repository name: " repo_name

if gh repo ls --json name --jq '.[].name' | grep -Fxq $repo_name; then
  pass
else
  read -p "Choose repository visibility(private/public): " repo_visibility
  gh repo create $repo_name --$repo_visibility
fi

git init

mkdir src
touch README.md .gitignore

read -p "Choose repo type(python/web/clear): " repo_type
if [ $repo_type == 'python' ]; then
  touch src/main.py
  python3 -m venv .venv
  source .venv/bin/activate
elif [ $repo_type == 'web' ]; then
  touch src/index.html src/style.css src/script.js
else
  pass
fi

git add .
git commit -m 'initial commit'

git branch -M main
git remote add origin git@github.com:$username/$repo_name.git

git push -u origin main
