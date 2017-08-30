#!/bin/sh

#
# Download, build and install all bilo libraries
#


download_and_execute () 
{
  git clone https://github.com/bilo/$1.git
  cd $1
  ./gradlew $2
  cd ..
} 


set -e

if [ -z ${ANDROID_HOME+x} ]
then
  echo "environment variable ANDROID_HOME is not set"
  exit 1
fi


directory=`mktemp -d`

cd ${directory}

download_and_execute bilo-util install
download_and_execute bilo-stack install
download_and_execute bilo-model-io install
download_and_execute bilo-access install
download_and_execute bilo-access-simulated install
download_and_execute bilo-access-android installArchives

cd ..
rm -rf ${directory}




