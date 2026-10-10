#!/bin/sh
set -e

cd "$(dirname "$0")/../packages/core/localization"
fvm flutter gen-l10n
