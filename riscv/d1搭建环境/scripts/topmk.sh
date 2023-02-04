#!/bin/bash
# **********************************************************
# * Author        : damon
# * Email         : lshua312@163.com
# * Create Time   : 2023-02-04
# * File Name     : topmk.sh
# * Description   : 
# **********************************************************

set -e

WORK_TESLA_PATH="`pwd`"
echo $WORK_TESLA_PATH
TESLA_KERNEL_PATH=${WORK_TESLA_PATH}/linux
TESLA_OUTPUT_PATH=${WORK_TESLA_PATH}/output
TESLA_SBI_PATH=${WORK_TESLA_PATH}/opensbi
TESLA_GNU_TOOLS_REPO_PATH=${WORK_TESLA_PATH}/riscv-gnu-toolchain
TESLA_CROSS_COMPILE=


#mk buildroot
#mk qemu
#mk tools



#create output dir and link files

cd ${WORK_TESLA_PATH}
if [ ! -d output ] ; then
        mkdir output
fi

