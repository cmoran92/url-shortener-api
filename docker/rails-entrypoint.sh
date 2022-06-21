#!/bin/bash

# Container user attributes
USER_NAME=dev
USER_ID=$(stat -c '%u' Gemfile)
GROUP_ID=$(stat -c '%g' Gemfile)

# Create group and user
groupadd -g $GROUP_ID $USER_NAME
# Create user if it does not exist
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -o -c "" -m $USER_NAME

echo "Starting with user $USER_NAME ($USER_ID)"
exec /usr/local/bin/gosu $USER_NAME "$@"
