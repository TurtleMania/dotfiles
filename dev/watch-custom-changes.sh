#!/usr/bin/env sh

cd "$(dirname "$(realpath "$0")")/.." # Go to dotfile base
git update-index --no-skip-worktree config/.config/hypr/custom/*
