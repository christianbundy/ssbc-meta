if ! [ -a .meta ]; then
  BRANCH=$(git remote show origin | grep "HEAD branch" | sed "s/.*: //")
  git fetch origin
  git checkout $BRANCH
  git reset --hard origin/$BRANCH
  git clean -fdx
  if ! [ -a .github/stale.yml ]; then
    echo "no stale exists"
    mkdir -p .github
    cp ../stale.yml .github/stale.yml
    git add .github/stale.yml
    git commit -S -m 'Add config for Stale app'
    git push origin $BRANCH
  fi
fi
