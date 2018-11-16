modules="../modules.scuttlebutt.nz/"
mkdir -p $modules/misc/

if ! [ -a .meta ]; then
  BRANCH=$(git remote show origin | grep "HEAD branch" | sed "s/.*: //")
  git fetch origin
  git checkout $BRANCH
  git reset --hard origin/$BRANCH
  if [ -a package.json ] && [ -a README.md ] && [ ! -a book.js* ]; then
    name=${PWD##*/}
    if compgen -G "$modules/**/$name.md" > /dev/null; then
      echo "already exists"
    else 
      echo "adding new module"
      echo "{% include \"git+https://github.com/ssbc/$name.git/README.md\" %}" > "$modules/misc/$name.md"
    fi
  fi
fi
