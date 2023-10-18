# Download Boost (Boost C++ Libraries 1.64 or more is required)
# One can skip this step if Boost is already available.
echo "Building from test.sh"
wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz
tar xvf boost_1_78_0.tar.gz
export BOOST_ROOT=$PWD/boost_1_78_0

git clone https://github.com/LLNL/metall
export METALL_INCLUDE=$PWD/metall/include

echo "installing g++"
apt-get install g++

echo "compiling program"
g++ -std=c++17 your_program.cpp -lstdc++fs -I${BOOST_ROOT} -I${METALL_INCLUDE}

pwd
touch howdy

# https://github.com/heroku/heroku-buildpack-apt
# https://github.com/Starkast/heroku-buildpack-cmake