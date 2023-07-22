#! /usr/bin/env -S awk -f

BEGIN { FS=/"/ } /ownerFullName/ {print} /range/
