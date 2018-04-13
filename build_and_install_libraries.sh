#!/bin/sh

#
# Download, build and install all bilo libraries
#

set -e

download_and_execute () 
{
  git clone https://github.com/bilo/$1.git
  cd $1
  ./gradlew -p $2 $3
  cd ..
  rm -rf $1
} 


if [ -z ${ANDROID_HOME+x} ]
then
  echo "environment variable ANDROID_HOME is not set"
  exit 1
fi


directory=`mktemp -d`

cd ${directory}

download_and_execute bilo-util ./ install
download_and_execute bilo-stack ./ install
download_and_execute bilo-model-io ./ install
download_and_execute bilo-access bilo-access-common install
download_and_execute bilo-access bilo-access-simulated install
download_and_execute bilo-access bilo-access-android installArchives

cd ..
rm -rf ${directory}




