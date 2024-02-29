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
sudo make linux
```

验证工具链安装成功

```
liush@liush-VirtualBox:~/workplace/damon-liush/temp/riscv-gnu-toolchain/build$ /opt/riscv64/bin/riscv64-unknown-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=/opt/riscv64/bin/riscv64-unknown-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/opt/riscv64/libexec/gcc/riscv64-unknown-linux-gnu/12.2.0/lto-wrapper
Target: riscv64-unknown-linux-gnu
Configured with: /home/liush/workplace/damon-liush/temp/riscv-gnu-toolchain/build/../gcc/configure --target=riscv64-unknown-linux-gnu --prefix=/opt/riscv64 --with-sysroot=/opt/riscv64/sysroot --with-pkgversion=g2ee5e430018 --with-system-zlib --enable-shared --enable-tls --enable-languages=c,c++,fortran --disable-libmudflap --disable-libssp --disable-libquadmath --disable-libsanitizer --disable-nls --disable-bootstrap --src=/home/liush/workplace/damon-liush/temp/riscv-gnu-toolchain/gcc --disable-multilib --with-abi=lp64d --with-arch=rv64imafdc --with-tune=rocket --with-isa-spec=2.2 'CFLAGS_FOR_TARGET=-O2   -mcmodel=medlow' 'CXXFLAGS_FOR_TARGET=-O2   -mcmodel=medlow'
Thread model: posix
Supported LTO compression algorithms: zlib
gcc version 12.2.0 (g2ee5e430018) 
```

### 2.3 构建rootfs

```
cd buildroot
make qemu_riscv64_virt_defconfig
make
```

确认rootfs构建成功

```
$ cd images/
$ ls
fw_dynamic.bin  fw_dynamic.elf  fw_jump.bin  fw_jump.elf  Image  rootfs.ext2  rootfs.tar  start-qemu.shiush@liush-VirtualBox:~/workplace/damon-liush/temp/buildroot/output$ cd images/
liush@liush-VirtualBox:~/workplace/damon-liush/temp/buildroot/output/images$ ls
fw_dynamic.bin  fw_dynamic.elf  fw_jump.bin  fw_jump.elf  Image  rootfs.ext2  rootfs.tar  start-qemu.sh
```

### 3 . 构建脚本

- 顶层脚本  

- 内核脚本

- rootfs脚本

- opensbi脚本

- qemu脚本

- tools脚本

- 执行脚本

### 4. 运行调试

### 5. GDB调试

```
qemu-system-riscv32 -M virt -m 1G -smp 2 -bios fw_jump.elf -kernel Image -append "rootwait root=/dev/vda ro" -drive file=rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic -S -s
riscv32-unknown-linux-gnu-gdb --tui vmlinux
- target remote localhost:1234
```


