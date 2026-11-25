#!/bin/bash

# run.sh

# Set MAVEN_OPTS environment variable
export MAVEN_OPTS="--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED"

# The first argument is the main class (com.project.Main if none is given)
mainClass=${1:-com.project.Main}

echo "Setting MAVEN_OPTS to: $MAVEN_OPTS"
echo "Main Class: $mainClass"

# Execute mvn command with the profile and main class as arguments
execArg="-Dexec.mainClass=$mainClass"
echo "Exec args: $execArg"

# Execute mvn command
mvn clean test-compile exec:java -PrunMain "$execArg"
