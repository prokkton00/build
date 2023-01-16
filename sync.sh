#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $HOME/work
mkdir ~/bin && PATH=~/bin:$PATH && cd ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo && cd ~ && git clone https://github.com/akhilnarang/scripts.git scripts && cd scripts && bash setup/android_build_env.sh && cd ~ && git config --global user.name parikk && git config --global user.email fariqhfebrian18@gmail.com

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
