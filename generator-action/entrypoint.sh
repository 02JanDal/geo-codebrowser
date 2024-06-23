#!/bin/bash

set -e

OUTPUT=$1
BUILD=$2
PROJECT=$3
EXTERNAL=$4

# Check if required arguments are provided
if [[ -z "$OUTPUT" || -z "$BUILD" || -z "$PROJECT" ]]; then
  echo "Error: OUTPUT, BUILD, and PROJECT are required arguments."
  exit 1
fi

# Construct the command dynamically to exclude -e if EXTERNAL is empty
CMD="/codebrowser_generator -a -o $OUTPUT -b $BUILD -p $PROJECT"
if [[ -n "$EXTERNAL" ]]; then
  CMD="$CMD -e $EXTERNAL"
fi

# Execute the commands
eval "$CMD"
/codebrowser_indexgenerator $OUTPUT
