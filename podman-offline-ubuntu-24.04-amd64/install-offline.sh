#!/bin/sh
set -eu

bundle_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
source_file=$(mktemp)
lists_dir=$(mktemp -d)
chmod 755 "$lists_dir"
trap 'rm -f "$source_file"; sudo rm -rf "$lists_dir"' EXIT HUP INT TERM

printf 'deb [trusted=yes] file:%s ./\n' "$bundle_dir" > "$source_file"

sudo apt-get \
  -o Dir::Etc::sourcelist="$source_file" \
  -o Dir::Etc::sourceparts=- \
  -o Dir::State::lists="$lists_dir" \
  update

sudo apt-get \
  -o Dir::Etc::sourcelist="$source_file" \
  -o Dir::Etc::sourceparts=- \
  -o Dir::State::lists="$lists_dir" \
  --no-install-recommends \
  install podman uidmap slirp4netns passt aardvark-dns
