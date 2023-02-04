# **********************************************************
# * Author        : damon
# * Email         : lshua312@163.com
# * Create Time   : 2023-02-04
# * File Name     : topmk.sh
# * Description   : 
# **********************************************************

#mk linux
cd ${TESLA_KERNEL_PATH}
if [ ! -f .config ] ; then
        make ARCH=riscv defconfig
fi

make vmlinux CROSS_COMPILE=${TESLA_CROSS_COMPILE} ARCH=riscv
make modules CROSS_COMPILE=${TESLA_CROSS_COMPILE} ARCH=riscv
make Image CROSS_COMPILE=${TESLA_CROSS_COMPILE} ARCH=riscv

if [ ! -f ${TESLA_KERNEL_PATH}/arch/riscv/boot/Image ] ; then
        echo "Image not exist, kernel compile failed."
        exit 1
fi

#cp ${TESLA_KERNEL_PATH}/arch/riscv/boot/Image ${TESLA_OUTPUT_PATH}
#cp ${TESLA_KERNEL_PATH}/vmlinux ${TESLA_OUTPUT_PATH}
