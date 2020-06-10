#!/bin/bash

set -e

# Recreate config file
rm -rf /root/build/env.config.js
touch /root/build/env.config.js

if [ ! -f /root/.env ]; then
  cp /root/.env.example /root/.env
fi

# Add assignment
echo "window._env_ = {" >> /root/build/env.config.js

# Read each line in .env file
# Each line represents key=value pairs
while read -r line || [[ -n "$line" ]];
do
  # Split env variables by character `=`
  if printf '%s\n' "$line" | grep -q -e '='; then
    varname=$(printf '%s\n' "$line" | sed -e 's/=.*//')
    varvalue=$(printf '%s\n' "$line" | sed -e 's/^[^=]*=//')
  fi

  # Read value of current variable if exists as Environment variable
  value=$(printenv | grep -w $varname | awk -F "=" '{print $2}')
  # Otherwise use value from .env file
  [[ -z $value ]] && value=${varvalue}

  # Append configuration property to JS file
  echo "  $varname: \"$value\"," >> /root/build/env.config.js
done </root/.env

echo "}" >> /root/build/env.config.js

exec "$@"