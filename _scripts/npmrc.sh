if ! [ -a .meta ]; then
  BRANCH=$(git remote show origin | grep "HEAD branch" | sed "s/.*: //")
  git fetch origin
  git checkout $BRANCH
  git reset --hard origin/$BRANCH
  git clean -fdx
  if [ -a package.json ] && ! [ -a .npmrc ] && ! [ -a package-lock.json ] && ! [ -a npm-shrinkwrap.json ]; then
    echo 'package-lock=false' > .npmrc
    git add .npmrc
    git commit -S -m 'Add .npmrc to disable package-lock.json'
    git push origin $BRANCH
  fi
fi
