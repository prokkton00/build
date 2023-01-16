#!/bin/bash

# Change to the Source Directory
cd $HOME/work

# Set-up ccache
cache -M 30G

# Prepare the Build Environment
. build/envsetup.sh

# lunch the target
lunch evolution_lmi-user || { echo "ERROR: Failed to lunch the target!" && exit 1; }

# Build the Code
mka evolution

# Exit
exit 0
