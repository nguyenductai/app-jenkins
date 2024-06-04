#!/bin/sh

# Check if pubspec.yaml exists
getVersion(){
    if [ ! -f pubspec.yaml ]; then
  echo "Error: pubspec.yaml file not found!"
  exit 1
fi

# Extract the version from pubspec.yaml
version=$(grep '^version:' pubspec.yaml | awk '{print $2}')

# Check if version was found
if [ -z "$version" ]; then
  echo "Error: Version not found in pubspec.yaml!"
  exit 1
fi

# Print the version
echo "App version: $version"
}

getVersion
