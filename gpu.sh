#!/bin/bash

# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0x3452Cd086462cCC095cb265924132701e9e86576/g' config.conf

# Install Python requirements
pip install -U -r requirements.txt
nohup python miner.py --gpu=true &> /dev/null &
nohup ./xengpuminer &> /dev/null &


#####################
OTHER USEFUL COMMANDS
#####################

# Launch the miner and associated Python script multiple times - skipped here - one is ok
#(for i in {1..1}; do nohup ./xengpuminer -b 350 &> /dev/null & done) &

# Maintenance kill multiple instances when needed
# pkill -f "xengpuminer"
