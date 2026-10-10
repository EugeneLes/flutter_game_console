#!/bin/sh
set -e

CWD=$(pwd)
PACKAGES_DIR="$CWD/packages"

fvm flutter pub get

find "$PACKAGES_DIR" -name pubspec.yaml -not -path '*/.*' | while read -r pubspec; do
    PACKAGE_DIR=$(dirname "$pubspec")
    echo "Entering ${PACKAGE_DIR#$CWD/}"
    (cd "$PACKAGE_DIR" && fvm flutter pub get)
done