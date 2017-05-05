#!/bin/bash

if $# -ne 1; then
    echo "Expected 1 argument, found $#"
fi

#Set cpufreq to a constant
sudo modprobe cpufreq_userspace
sudo cpupower frequency-set --governor userspace
sudo cpupower --cpu all frequency-set --freq $1

cat /proc/cpuinfo | grep MHz
