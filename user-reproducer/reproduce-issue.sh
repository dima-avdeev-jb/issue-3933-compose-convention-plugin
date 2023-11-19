#!/bin/bash
cd "$(dirname "$0")"

echo "---------------- before first launch ----------------"
./gradlew --stop -q && ./gradlew clean build -q
echo "---------------- after first launch -----------------"
rm -rf build
rm -rf .gradle
rm -rf buildSrc/build
rm -rf buildSrc/.gradle
echo "---------------- before second launch ---------------"
./gradlew --stop && ./gradlew clean build -i
echo "---------------- after second launch ----------------"
