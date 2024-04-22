#!/usr/bin/env bash
originalDir=$(realpath "$0")
echo "Starting local webpack server (assumed to be running (for .envrc) in original directory $originalDir)"


docker compose up -d
