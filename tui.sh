#!/bin/bash

username=$(gh auth status -a --json hosts --jq '.hosts.[].[].login')
repo_name=$(gum input --header "Your repo name:" --placeholder "todo-app")

# we need to check if the repo already exists and if not we create one with the choosen name
if gh repo ls --json name --jq '.[].name' | grep -Fxq $repo_name; then
  :
else
  repo_description=$(gum input --placeholder "A short description of your project: ")
  repo_visibility=$(gum choose --header "Repository visibility: " "private" "public" --limit 1)
  gh repo create $repo_name --$repo_visibility --description "$repo_description"
fi

git init

touch README.md .gitignore

repo_preset=$(gum choose --header "Preset: " "python" "web" "clear" "clear(without src)" --limit 1)
if [ $repo_preset == 'python' ]; then
  # we create a python venv
  mkdir src
  touch src/main.py
  python3 -m venv .venv
  source .venv/bin/activate
  cat >> .gitignore << 'EOF'
.venv/
__pycache__/
*.pyc
*.pyo
*.pyd
.env
.env.local
dist/
build/
*.egg-info/
.pytest_cache/
.mypy_cache/
EOF
elif [ $repo_preset == 'web' ]; then
  mkdir src
  touch src/index.html src/style.css src/script.js
  cat >> .gitignore << 'EOF'
node_modules/
dist/
build/
.env
.env.local
.cache/
*.log
EOF
elif [ $repo_preset == 'clear' ]; then
  mkdir src
else
  :
fi

cat >> README.md << EOF
  $(gum write --header "A short README for your project: ")
EOF

git add .
git commit -m 'initial commit'

git branch -M main
git remote add origin git@github.com:$username/$repo_name.git

git push -u origin main
