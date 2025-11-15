#!/bin/bash
set -e  # fail on first error

mkdir -p results

robot --console verbose -d results tests

echo "Robot tests completed."