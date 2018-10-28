#!/bin/bash

#  For testing purposes only:
#    Remove the previous container instance
#    Just in case to ensure clean context

echo "  *** Cleaning the Docker container instances:" 
docker stop $(docker ps -lq)
docker rm $(docker ps -lq)

#  For testing purposes only:
#    Remove any previous container image with the same name
#    The container image is named as "camtest".

echo "  *** Cleaning up the docker image and output file:" 
docker image rm camtest 
rm ./app/output.csv

#  Build a fresh image from the Dockerfile and the contents
#  Note: The container image is named as "camtest".
#  in the current directory.  The current directory is expected
#  to have the following content
#  tree
#   |-- Dockerfile
#   |-- app
#        |-- cambia.py
#        |-- input.csv

echo "  *** Building the Docker image - camtest:" 
docker build -t camtest .

#  Run the named Docker image with volume mapping to allow 
#  for quick inspection of the test results.
#  Caveat:  A child directory in the name of "app" with the same
#  two files named above for image creation are expected to present
#  in the current folder.
#  Note:  There must be a better way to do this, which should be
#  pursued when the bandwidth allows

echo "  *** Running the Docker container with mapped volume at ./app:" 
docker run -d -v"$(pwd)"/app:/app camtest

# Simple content inspection of the input and output files contents
echo "  *** input.csv content:" 
cat ./app/input.csv 

echo "  *** output.csv content:" 
sleep 1
cat ./app/output.csv

# Check Docker container logs for potential errors
echo "  *** Potential container instace execution logs:" 
docker logs $(docker ps -lq)
