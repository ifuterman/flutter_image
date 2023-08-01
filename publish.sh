#!/bin/bash

usage() {
  echo "Usage $0 -v version_number";
  exit 1;
}

while getopts ":v:" o; do
    case "${o}" in
        v)
            v=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

docker build -t longevity:"${v}" .
docker tag longevity:"${v}" ifuterman/longevity:"${v}"
docker push ifuterman/longevity:"${v}"