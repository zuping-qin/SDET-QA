Programming assignment design and implemention:

Design:

The goal is to allow a user to run a series of Docker command to produce
the desired output without the user having to know which program runs to
produce the output.

A very simple approach was taken to limit the time and effort involved.  The
solution does not allow for the user to explicitly provide an input and output
files when the container is run.  Instead, the input file is embedded in the
container itself, and the output file is shared through volume sharing with
the Docker host, through a specifically required directory structure.  (For
Details, please see the test.sh comments)

Another way to approach the solution is to allow the user to provide input file
contents and output file location via parameters in the docker run command.
However, the implementation would be quite more involved.  Even the current, 
simple solution has to consider some peculiarities with the way Docker shares
data between the container instance and the host.

To quick test the result, the user is expected to run
  ./setup_runtest.sh
in the current directory with the exact directory structure for the "app"
folder (Again, see the shell script comments for more info).  If things go
correctly, the output file should be availalbe for inspection in the
following location: "./app/output.csv".

If one desires, another input file with different contents can be copied
over to ./app/ folder and named as "input.csv", then execute ./run_test.sh.
Afterwards, the new output file named "output.csv" should be generated for
inspection as well.
