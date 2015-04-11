#!/usr/bin/env bash

if [[ -f Generatefile ]]; then
    crystal run libs/generate/core.cr -- $*
else
    dir=$(dirname $0)
    $dir/generate-core $*
fi
