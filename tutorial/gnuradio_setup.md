# 安装GNU RADIO
[参考](https://wiki.gnuradio.org/index.php/UbuntuInstall#Building_GNU_Radio_on_Ubuntu_Linux)
## 依赖安装
```bash 
sudo apt install git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy \
python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev libcomedi-dev \
libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 \
liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins \
python3-zmq 
```

## 安装GNU RADIO
[参考](https://wiki.gnuradio.org/index.php/InstallingGR#To_install_system_wide)
```bash
git clone --recursive https://github.com/gnuradio/gnuradio.git
cd gnuradio
git checkout maint-3.8 # change `maint-3.8` if you want to use a different version; see releases
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../ 
make -j4
make test
sudo make install
sudo ldconfig
```

执行到`make test`的时候显示

```
The following tests FAILED:
243 - qa_polar_decoder_sc (Failed)
244 - qa_polar_decoder_sc_list (Failed)
245 - qa_polar_decoder_sc_systematic (Failed)
246 - qa_polar_encoder (Failed)
247 - qa_polar_encoder_systematic (Failed)
```

运行:
```
sudo apt-get install python-scipy
```
依然失败，运行`ctest -V -R qa_polar_decoder_sc`发现缺少`scipy`包,运行`pip install scipy`安装，通过。

>The [**ctest**](https://cmake.org/cmake/help/latest/manual/ctest.1.html) ctest executable is the CMake test driver program. CMake-generated build trees created for projects that use the `enable_testing()` and `add_test()` commands have testing support. This program will run the tests and report results.

**命令`gnuradio_companion`运行成功！！**

## Configuring USRP support
**问题：** *UHD在labview和gnuradio中通用吗？*

[UHD安装](https://kb.ettus.com/Building_and_Installing_the_USRP_Open-Source_Toolchain_(UHD_and_GNU_Radio)_on_Linux#Configuring_USB)

这一步看不太懂，以后再操作。

## 插曲
想一想其实直接用命令安装也一样，就决定改回用包安装。

```bash
sudo apt install gnuradio
```

运行gnuradio_companion出错：
```
ModuleNotFoundError
Cannot import gnuradio.
Is the model path environment variable set correctly?
    All OS: PYTHONPATH
Is the library path environment variable set correctly?
    Linux: LD_LIBRARY_PATH
    Windows: PATH
    MacOSX: DYLD_LIBRARY_PATH
(No module named 'gnuradio')
```
加入路径后仍然没有解决问题。

```
sudo apt purge gnuradio
```

## 继续学习
> If the installation worked without any trouble, you're ready to use GNU Radio! If you have no idea how to do that, read the [page on how to use GNU Radio](https://wiki.gnuradio.org/index.php/HowToUse). You probably want to connect some [Hardware](https://wiki.gnuradio.org/index.php/Hardware) to your computer to try and receive or transmit stuff. If you or your group would like to get a professional jump start on using GNU Radio and the USRP, [Corgan Labs](http://corganlabs.com/) offers a 3-day, hands-on training class that can be held at your own location.
