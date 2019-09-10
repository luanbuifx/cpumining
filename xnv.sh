#!/bin/bash
sudo apt update && apt upgrade
sudo apt-get install unzip 
mkdir nerva
cd nerva
wget https://getnerva.org/content/binaries/nerva-v0.1.6.8_linux-x64.zip && unzip nerva-v0.1.6.8_linux-x64.zip 
wget https://getnerva.org/content/bootstrap/mainnet.raw  && ./nerva-blockchain-import --input-file /root/mainnet.raw --verify 0
./nervad --start-mining NizKdaicW4bVfYB3AVhnsq9qnvUYSKe568YaNV2KQCYCDrNGzpvxqBo6mxF8cBkiQDU5xkgB2PrUGFKf66wVDVoNbQBhorGKawJ7Rqtbzupen --mining-threads 4
