sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
# raspberry pi
sudo rpi-update

sudo apt-get --assume-yes install build-essential git cmake pkg-config
sudo apt-get --assume-yes install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev
sudo apt-get --assume-yes install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get --assume-yes install libgtk2.0-dev
sudo apt-get --assume-yes install libatlas-base-dev gfortran qtcreator qt-sdk
cd ~
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout 3.1.0

cd ~
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.1.0

sudo --assume-yes apt-get install python2.7-dev python-pip
sudo --assume-yes apt-get install python3-dev python3-pip


sudo pip3 install numpy
sudo pip install numpy
# raspberry pi
sudo pip-3.2 install numpy

cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=OFF \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..

make -j4

sudo make install
sudo ldconfig

echo -e "\e[91mIF ERROR "
echo -e "change include to : #include \"/usr/include/hdf5/serial/hdf5.h\"\n"
echo -e "in /opencv_contrib-3.1.0/modules/hdf/include/opencv2/hdf/hdf5.hpp"
