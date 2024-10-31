#!/bin/bash

# Read the timer value from the file


date -d@$(cat ./Documents/constant-files/pomodorotimer) -u +%H:%M:%S
