#!/bin/bash
cd "$(dirname "$0")"
set -e # fail fast

export COMPOSE_CUSTOM_VERSION=0.0.0-custom-version
../../../JetBrains/compose-multiplatform/compose/scripts/publishGradlePluginToMavenLocal

./gradlew --stop -q
echo "---------------- before first launch ----------------"
./gradlew clean build -q --no-daemon || echo "skip first"
echo "---------------- after first launch -----------------"
rm -rf build
rm -rf .gradle
rm -rf buildSrc/build
rm -rf buildSrc/.gradle
echo "---------------- before second launch ---------------"
./gradlew clean build --no-daemon #--stacktrace -i
echo "---------------- after second launch ----------------"
