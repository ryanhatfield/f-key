#!/usr/bin/env bash

set -e          # Exit on any error. Use `COMMAND || true` to nullify
set -E          # Functions inherit error trap
set -u          # Error on unset variables. Use ${var:-alternate value} to bypass
set -f          # Error on attempted file globs (e.g. *.txt )
set -o pipefail # Failed commands in pipes cause the whole pipe to fail

inputFilename="$1"
tempFilename="temp-$inputFilename"
outputFilename="output-$inputFilename"

# Convert the PDF into something more manageable
qpdf --qdf --object-streams=disable "$inputFilename" "$tempFilename"

# This is an example of how to find and replace based on patterns
# sed -i 's/old-text/new-text/g' "$tempFilename"

qpdf "$inputFilename" "$outputFilename"
