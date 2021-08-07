#!/usr/bin/env bash

packageName="vanilla-component.js"
workspace=$(pwd)
commitId=$(git rev-parse HEAD)
version=$(node -p "require('./package.json').version")

echo $packageName
echo $workspace
echo $commitId
echo $version

yarn

yarn build

cat dist/vanilla-component.min.js

git config --global user.email "creaticoding@gmail.com"
git config --global user.name "CreatiCoding"
git clone --depth=1 "https://$GITHUB_TOKEN@github.com/creco-org/cdn.creco.me.git" ../cdn.creco.me

if [ -d "../cdn.creco.me/packages/$packageName/$version" ]; then
  echo "../cdn.creco.me/packages/$packageName/$version"
  exit 1
else
  mkdir -p "../cdn.creco.me/packages/$packageName/$version"
  cp -a ./dist/. ../cdn.creco.me/packages/$packageName/$version
  ls -al ../cdn.creco.me/packages/
  ls -al ../cdn.creco.me/packages/$packageName
  ls -al ../cdn.creco.me/packages/$packageName/$version

  cd ../cdn.creco.me

  deployDate=$(date -R)
  git add -A
  git commit -m "deploy($packageName): $version($commitId) $deployDate"
  git push origin main
fi
