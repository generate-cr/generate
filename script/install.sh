#!/usr/bin/env bash

touch Generatefile

mkdir -p bin &&
  crystal build libs/generate/core.cr -o bin/generate-cr

echo "Created bin/generate-cr"
