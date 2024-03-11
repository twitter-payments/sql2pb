#!/bin/sh

# This script creates a tag from the command line. We could update
# this script to read from a specific

VERSION="${1}"

if [[ "${VERSION:0:1}" != "v" ]]; then
    echo "Error: $VERSION must start with v"
    exit 1
else
    continue
fi

if [ $(git tag -l "$VERSION") ]; then
    echo "Error: $VERSION tag already exists"
    exit 1
else
    continue
fi

echo "Creating tag ${VERSION}"
git tag "${VERSION}"

echo "Pushing tags to origin"
git push origin --tags