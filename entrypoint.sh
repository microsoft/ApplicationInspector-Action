#!/bin/bash

# $1 is the path relative to repo root to scan
# $2 is the output path relative to repo root.
# $3 is the output format
# $4 is the comma separated list to glob patterns to ignore
# $5 is the arguments
# $6 is if beta should be used

if [ ${3,,} = "html" ]; then
    echo "html output is not supported in the GitHub Action."
    exit -1
fi

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

if [ "$4" != "," ]; then
    IFS=',' read -ra SPLITS <<< "$4"
    for i in "${SPLITS[@]}"; do
        IgnoreArg = "${IgnoreArg},$GITHUB_WORKSPACE/$i"
    done
    IgnoreArg = "-g ${IgnoreArg:1}"
fi

if [ "$6" = "true" ]; then
    /beta-tools/appinspector analyze --no-show-progress -s "$ScanTarget" -o "$OutputPath" -f $3 $IgnoreArg $5
else
    /tools/appinspector analyze --no-show-progress -s "$ScanTarget" -o "$OutputPath" -f $3 $IgnoreArg $5
fi