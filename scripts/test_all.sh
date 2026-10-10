#!/bin/sh
set -e

CURRENT_DIR=$(dirname "$0")
PACKAGES_DIR="packages"
TEST_DIR="test"

cd "$CURRENT_DIR/.."
echo "Testing the app"
fvm flutter test --dart-define=OS=ios

find "$PACKAGES_DIR" -name pubspec.yaml -not -path '*/.*' | while read -r pubspec; do
    PACKAGE_DIR=$(dirname "$pubspec")
    if [ -d "$PACKAGE_DIR/$TEST_DIR" ]; then
        echo "Testing ${PACKAGE_DIR#$PWD/}"
        (cd "$PACKAGE_DIR" && fvm flutter test --dart-define=OS=ios)
    fi
done
