# RISC-V验证环境搭建

本文记录使用QEMU、Linux、Buildroot搭建RISC-V的验证环境

## 1. 下载开源部件

qemu：git clone https://github.com/qemu/qemu.git

Linux：git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

OpenSBI：git clone https://github.com/riscv-software-src/opensbi.git

buildroot：git clone  https://github.com/buildroot/buildroot.git

riscv-gnu-toolchain：git clone https://github.com/riscv-collab/riscv-gnu-toolchain.git

## 2. 构建环境

### 2.1 系统环境

```
riscv-gnu-toolchain： sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build
qemu: sudo apt-get install libglib2.0-dev meson libpixman-1-dev
```

### 2.1 构建qemu

```
cd qemu
mkdir build
cd build
../configure --target-list=riscv64-softmmu,riscv64-linux-user --prefix=/opt/qemu
make -j2
make install

```

验证qemu安装成功

```
/opt/qemu/bin/qemu-system-riscv64 --version
QEMU emulator version 7.2.50 (v7.2.0-1089-g5736527050)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
```

### 2.2 构建工具链

```
cd riscv-gnu-toolchain
mkdir build
cd build
../configure --prefix=/opt/riscv64
make linux
```

验证工具链安装成功

```

```

### 2.3 构建rootfs

```
cd buildroot
make qemu_riscv64_virt_defconfig
make
```

确认rootfs构建成功

```

```

### 2

### u

git clone https://github.com/qemu/qemu.git

mkdir build
cd build
../configure
make

## 2. 下载社区内核

## 3. 下载OpenSBI

## 4. 下载buildroot


