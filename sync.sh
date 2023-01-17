#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $HOME/work

# Change to the Source Directory
cd $HOME/work

# Init Repo
repo init -u https://github.com/Evolution-X/manifest.git -b tiramisu --depth=1

# Sync the Sources
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Clone Trees
git clone --depth=1 https://github.com/parikk/device_xiaomi_lmi.git -b 13-evox device/xiaomi/lmi || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
git clone --depth=1 https://github.com/parikk/vendor_xiaomi_lmi.git -b 13-evox vendor/xiaomi/lmi
git clone --depth=1 https://github.com/ProjectElixir-Devices/kernel_xiaomi_lmi.git -b zen_plus-13 kernel/xiaomi/lmi

# Custom
git clone --depth=1 https://gitlab.com/Roxor-007/WeebX_clang16.git -b main prebuilts/clang/host/linux-x86/clang-weebx

# Exit
exit 0
