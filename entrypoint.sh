#!/bin/bash

# $1 is the path relative to repo root to scan
# $2 is the output path relative to repo root.
# $3 is the output format
# $4 is the arguments

if [ "$1" = "GITHUB_WORKSPACE" ]; then
    ScanTarget=$GITHUB_WORKSPACE
else
    ScanTarget=$GITHUB_WORKSPACE/$1
fi

if [ "$2" = "AppInspectorResults" ]; then
    OutputPath=$GITHUB_WORKSPACE/$2.$3
else
    OutputPath=$GITHUB_WORKSPACE/$2
fi

/tools/appinspector analyze -s "$ScanTarget" -o "$OutputPath" -f $3 $4