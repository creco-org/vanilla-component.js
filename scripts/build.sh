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

if [ -d "../cdn.creco.me/$packageName/$version" ]; then
  echo "../cdn.creco.me/$packageName/$version"
  exit 1
else
  mkdir -p "../cdn.creco.me/$packageName/$version"
  cp -a ./dist/. ../cdn.creco.me/$packageName/$version
  ls -al ../cdn.creco.me
  ls -al ../cdn.creco.me/$packageName
  ls -al ../cdn.creco.me/$packageName/$version

  cd ../cdn.creco.me

  deployDate=$(date -R)
  git add -A
  git commit -m "deploy($packageName): $version($commitId) $deployDate"
  git push origin main
fi
