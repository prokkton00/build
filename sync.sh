#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directory
cd $SYNC_PATH

# Init Repo
repo init -u $MANIFEST -b $MANIFEST_BRANCH --depth=1

# Sync the Sources
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Clone Trees
git clone --depth=1 $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
git clone --depth=1 $VT_LINK $VT_PATH
git clone --depth=1 $KT_LINK $KT_PATH

# Custom
git clone --depth=1 https://gitlab.com/Roxor-007/WeebX_clang16.git -b main prebuilts/clang/host/linux-x86/clang-weebx

# Exit
exit 0
