#!/bin/sh

# Install CMake
wget -q https://cmake.org/files/v3.21/cmake-3.21.3-Linux-x86_64.tar.gz
tar -xzf cmake-3.21.3-Linux-x86_64.tar.gz -C /app/.heroku/
export PATH="/app/.heroku/cmake-3.21.3-Linux-x86_64/bin:$PATH"

# Additional setup for your C++ application
