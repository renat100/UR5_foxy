#! /bin/bash

#NB: eseguito ogni volta che il container va in run (c'è già il filesystem col bind di App qui)

# X debug
pwd > /tmp/cancellare.txt
ls > /tmp/cancellare.txt

set -e

#Build del progetto ROS
#colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release

echo "Provided arguments: $@"

#xhost local:root


exec $@

