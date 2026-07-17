#!/usr/bin/env sh
set -eu

pages_root="gh-pages"
default_game="li2023"

mkdir -p "$pages_root"

for pattern in CNAME google*.html yandex*.html; do
  for source_file in overrides/$pattern; do
    if [ -f "$source_file" ]; then
      cp "$source_file" "$pages_root"/
    fi
  done
done

for root_file in overrides/robots.txt "$pages_root/$default_game/404.html"; do
  if [ -f "$root_file" ]; then
    cp "$root_file" "$pages_root"/
  fi
done

if [ -f "$pages_root/404.html" ]; then
  sed -i \
    -e "s#href=\"/assets/#href=\"/$default_game/assets/#g" \
    -e "s#src=\"/assets/#src=\"/$default_game/assets/#g" \
    -e "s#href=\"/stylesheets/#href=\"/$default_game/stylesheets/#g" \
    -e "s#src=\"/stylesheets/#src=\"/$default_game/stylesheets/#g" \
    -e "s#href=\"/\.\"#href=\"/$default_game/\"#g" \
    -e "s#new URL(\"/\",location)#new URL(\"/$default_game/\",location)#g" \
    "$pages_root/404.html"
fi
