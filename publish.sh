#!/bin/bash
if [[ ! -d ./dist ]]; then
    git clone -b gh-pages git@github.com:LoungeCPP/loungecpp.net.git dist
fi

GIT_REV=$(git rev-parse --short HEAD)
bundle exec middleman build

pushd ./dist

git config --local user.name "Bot Plus Plus"
git config --local user.email "TheBotPlusPlus@users.noreply.github.com"

echo ${GIT_REV} > built_from
git add -A .
git commit -m "Deploying ${GIT_REV}."
git push
