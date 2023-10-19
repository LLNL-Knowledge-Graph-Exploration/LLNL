# Download Boost (Boost C++ Libraries 1.64 or more is required)
# One can skip this step if Boost is already available.
echo "Releasing from test.sh"
wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz
tar xvf boost_1_78_0.tar.gz
export BOOST_ROOT=$PWD/boost_1_78_0

git clone https://github.com/LLNL/metall
export METALL_INCLUDE=$PWD/metall/include

pwd
touch howdy

# https://github.com/heroku/heroku-buildpack-apt
# https://github.com/Starkast/heroku-buildpack-cmake