#!/bin/bash

echo "🔧 Building Docker image..."
docker build -t robot-tests .

echo "🚀 Running Robot tests..."
docker run --rm -v "$(pwd)/results:/robot/results" robot-tests
