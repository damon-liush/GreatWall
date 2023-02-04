#!/bin/bash
# **********************************************************
# * Author        : damon
# * Email         : lshua312@163.com
# * Create Time   : 2023-02-04
# * File Name     : topmk.sh
# * Description   : 
# **********************************************************

set -e


#mk opensbi


cd ${TESLA_SBI_PATH}
make distclean
make PLATFORM=generic CROSS_COMPILE=${TESLA_CROSS_COMPILE} PLATFORM_RISCV_ISA=rv64gcv

if [ ! -f ${TESLA_SBI_PATH}/build/platform/generic/firmware/fw_jump.bin ] ; then
        echo "fw_jump.bin not exist, opensbi compile failed."
        exit 1
fi

#cp ${TESLA_SBI_PATH}/build/platform/generic/firmware/fw_jump.bin ${TESLA_OUTPUT_PATH}
