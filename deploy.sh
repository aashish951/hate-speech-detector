#!/bin/bash
sudo apt update
sudo apt install -y python3-pip python3-venv git

git clone https://github.com/aashish951/hate-speech-detector.git
cd hate-speech-detector

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

python HateSpeech.py
