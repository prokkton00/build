#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $HOME/work

# Change to the Source Directory
cd $HOME/work
sudo apt install openssh-server screen python-is-python3 git openjdk-8-jdk android-tools-adb bc bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses-dev lib32readline-dev lib32z1-dev  liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev libtinfo5 libncurses5 -y && sudo wget 'https://storage.googleapis.com/git-repo-downloads/repo' -P /usr/local/sbin/ && sudo chmod +x /usr/local/sbin/repo && sudo apt-get update -y && sudo apt-get install -y ccache && git config --global user.name parikk && git config --global user.email fariqhfebrian18@gmail.com

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
