#!/bin/bash

REMOTE="origin"
BRANCH="main"

git add -A
git commit --amend -m "Autocommit $(date "+%Y-%m-%d %H:%M:%S")"
git push --force "$REMOTE" "$BRANCH"
