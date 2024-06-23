#!/bin/bash

set -e

OUTPUT=$1
BUILD=$2
PROJECT=$3
EXTERNAL=$4

/codebrowser_generator -a -o /github/workspace/$OUTPUT -b /github/workspace/$BUILD -p $PROJECT -e $EXTERNAL
/codebrowser_indexgenerator /github/workspace/$OUTPUT