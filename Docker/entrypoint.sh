#! /bin/bash

#NB: eseguito ogni volta che il container va in run (c'è già il filesystem col bind di App qui)

set -e

source /opt/ros/foxy/setup.bash

echo "Provided arguments: $@"

xhost local:root


exec $@