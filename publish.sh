#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: ./publish.sh \"commit message\""
    exit 1;
fi

rm -Rf .sculpin
sculpin install
sculpin generate --env=prod
sculpin install

git stash
git checkout gh-pages

cp -R output_prod/* .
rm -rf output_*

git add *
git commit -m "$1"
git push origin --all

git checkout master
git stash pop
rm -Rf .sculpin
sculpin install
