#!/bin/bash
# Script to change plugin name occurances

echo "\033[34m\033[1mEnter the name of your plugin (readable):\033[0m "
read plugin_name
find ./ -type f ! -name "Init.sh" -exec sed -i '' -e "s/(#plugin_name#)/$plugin_name/g" {} >/dev/null 2>&1 \;

echo "\033[34m\033[1mEnter plugin slug:\033[0m "
read plugin_slug
find ./ -type f ! -name "Init.sh" -exec sed -i '' -e "s/(#plugin_slug#)/$plugin_slug/g" {} >/dev/null 2>&1 \;

echo "\033[34m\033[1mEnter plugin name in capitals without punctiuation or white spaces LIKETHIS:\033[0m "
read plugin_cap
find ./ -type f ! -name "Init.sh" -exec sed -i '' -e "s/(#plugin_cap#)/$plugin_cap/g" {} >/dev/null 2>&1 \;

echo "\033[34m\033[1mEnter plugin namespace:\033[0m "
read plugin_namespace
find ./ -type f ! -name "Init.sh" -exec sed -i '' -e "s/(#plugin_namespace#)/$plugin_namespace/g" {} >/dev/null 2>&1 \;

# Rename plugin-name.* to plugin_slug
mv ./plugin-name.php ${plugin_slug}.php
mv ./source/js/plugin-name.js ./source/js/${plugin_slug}.js
mv ./source/sass/plugin-name.scss ./source/sass/${plugin_slug}.scss

echo "\033[34m\033[1mLean back while I install required node modules for you…\033[0m"
npm install

# Clean up
rm Init.sh
find . -maxdepth 1 -name '*.DS_Store' -delete

echo "\033[34m\033[1mAll done!\033[0m"