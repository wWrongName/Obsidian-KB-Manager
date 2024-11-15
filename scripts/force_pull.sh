#!/bin/bash

git reset --hard HEAD

git fetch --all
git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
