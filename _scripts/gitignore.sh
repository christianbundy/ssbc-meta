if ! [ -a .meta ]; then
  BRANCH=$(git remote show origin | grep "HEAD branch" | sed "s/.*: //")
  git fetch origin
  git checkout $BRANCH
  git reset --hard origin/$BRANCH
  git clean -fdx
  if [ -a package.json ] && ! [ -a .gitignore ]; then
    echo 'node_modules' > .gitignore
    git add .gitignore
    git commit -S -m 'Add .gitignore to ignore node_modules'
    git push origin $BRANCH
  fi
fi
