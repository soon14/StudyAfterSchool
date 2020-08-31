#!/bin/bash

cmd=$(pwd)
echo "$cmd"


echo "hadoop  ALL=(ALL)       NOPASSWD: NOPASSWD: ALL" >> /etc/sudoers
useradd hadoop -g hadoop