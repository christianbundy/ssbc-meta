for name in $(curl -s 'https://api.github.com/orgs/ssbc/repos?per_page=100' | jq -r '.[].name'); do meta project add $name git@github.com:ssbc/$name.git; done
for name in $(curl -s 'https://api.github.com/orgs/ssbc/repos?per_page=100&page=2' | jq -r '.[].name'); do meta project add $name git@github.com:ssbc/$name.git; done
