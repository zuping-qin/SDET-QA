#!/bin/bash

#  This set of scripts is intended to be executed after the
#  the container instance is already in place and the user
#  wants to provide different input.csv files for additional
#  testing.
#  Main operations:
#    The user replace the default input.csv file in ./app directory;
#    Then she executes this script file to:
#        Clean up the current output.csv;
#        And execute the existing container instance to produce
#        the new output.csv file for inspection.

#  The current directory is expected
#  to have the following content
#  tree
#   |-- Dockerfile
#   |-- app
#        |-- cambia.py
#        |-- input.csv

#  Clean up/delete the existing output.csv
echo "  *** Cleaning up the output file:" 
rm ./app/output.csv

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
