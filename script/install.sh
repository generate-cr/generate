#!/usr/bin/env bash

mkdir -p $HOME/.generate-cr/bin

cd $HOME/.generate-cr

echo 'deps { github "generate-cr/generate" }' > Projectfile

crystal deps

touch Generatefile
crystal build libs/generate/core.cr -o bin/generate-core

curl https://raw.githubusercontent.com/generate-cr/generate/master/script/script.sh > bin/generate-cr
chmod a+x bin/generate-cr
