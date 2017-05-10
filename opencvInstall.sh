export http_proxy="http://proxy.iiit.ac.in:8080"
export https_proxy="https://proxy.iiit.ac.in:8080"
export ftp_proxy="http://proxy.iiit.ac.in:8080"

sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install -y libav-tools
sudo apt-get install -y libavcodec-extra-54 libavformat-extra-54
sudo apt-get install -y imagemagick
sudo apt-get install libavutil-dev libavformat-dev ibavcodec-dev


sudo apt-get -y remove ffmpeg x264 libav-tools libvpx-dev libx264-dev
sudo apt-get -y install build-essential checkinstall git libfaac-dev libgpac-dev \
libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev librtmp-dev libtheora-dev \
libvorbis-dev pkg-config texi2html yasm zlib1g-dev

# Install x264
sudo apt-get -y install libx264-dev
cd
git clone --depth 1 git://git.videolan.org/x264
cd x264
./configure --enable-static --enable-pic
make
sudo checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | \
awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes \
--fstrans=no --default

# Install AAC audio decoder
cd
wget http://downloads.sourceforge.net/opencore-amr/fdk-aac-0.1.0.tar.gz
tar xzvf fdk-aac-0.1.0.tar.gz
cd fdk-aac-0.1.0
./configure
make
sudo checkinstall --pkgname=fdk-aac --pkgversion="0.1.0" --backup=no \
--deldoc=yes --fstrans=no --default

# Install VP8 video encoder and decoder.
cd
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx
cd libvpx
./configure
make
sudo checkinstall --pkgname=libvpx --pkgversion="1:$(date +%Y%m%d%H%M)-git" --backup=no \
--deldoc=yes --fstrans=no --default


# Add lavf support to x264
# This allows x264 to accept just about any input that FFmpeg can handle and is useful if you want to use x264 directly. See a more detailed explanation of what this means.
cd ~/x264
make distclean
./configure --enable-static --enable-pic
make
sudo checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | \
awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes \
--fstrans=no --default

#version="$(wget -q -O - http://sourceforge.net/projects/opencvlibrary/files/opencv-unix | egrep -m1 -o '\"[0-9](\.[0-9])+' | cut -c2-)"
set -vx
version="2.4.11"
echo "Installing OpenCV" $version
mkdir OpenCV
cd OpenCV

echo "Install ffmpeg"
wget ffmpeg.org/releases/ffmpeg-2.7.1.tar.bz2
tar -xvf ffmpeg-2.7.1.tar.bz2
cd ffmpeg-2.7.1/
sudo apt-get install yasm
./configure --enable-gpl --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libx264 --enable-libxvid --enable-nonfree --enable-postproc --enable-version3 --enable-x11grab --enable-shared --enable-pic
make
sudo make install
cd ..

echo "Installing Dependenices"
sudo apt-get -qq install libopencv-dev build-essential cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils

echo "Downloading OpenCV" $version
wget -O OpenCV-$version.zip http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$version/opencv-"$version".zip/download

echo "Installing OpenCV" $version
unzip OpenCV-$version.zip
cd opencv-$version
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local/openCV_2411 -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j2
sudo checkinstall
sudo sh -c 'echo "/usr/local/openCV_2411/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
echo "OpenCV" $version "ready to be used"
