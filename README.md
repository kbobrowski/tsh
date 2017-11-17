# tesh - deep learning shell

tesh is a wrapper around Docker image which provides recent deep learning tools. It mounts current directory and X11 socket inside a container.

## List of software

- CUDA 8.0
- cuDNN 6
- tensorflow 1.3
- keras
- pytorch 0.2
- OpenCV 3.3.1 (GTK support)
- ffmpeg
- numpy, scipy, pandas, sklearn, jupyter, matplotlib, Pillow, h5py, scikit-image, sk-video

shell:
- zsh with oh-my-zsh
- pure prompt
- running as standard user

## Requirements

Requires Nvidia GPU with drivers installed, as well as Docker and
nvidia-docker2.

## Installation

Simply put tesh file somewhere in the PATH, and ```chmod +x tesh```.
