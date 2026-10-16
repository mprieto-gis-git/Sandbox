#!/bin/bash

list=("Augathella_1969_125cm_RHAP" "Blackall_1969_125cm_RHAP")

for name in ${list[@]}; do
    bash frames_compare.sh $name
done

