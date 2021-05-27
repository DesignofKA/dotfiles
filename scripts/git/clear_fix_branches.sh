#!/bin/bash
set -e

BRANCHES=$(git branch)

for i in BRANCHES; do
    echo "tester: $i"
done
