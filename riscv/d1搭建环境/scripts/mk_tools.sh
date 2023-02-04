#!/bin/bash
# **********************************************************
# * Author        : damon
# * Email         : lshua312@163.com
# * Create Time   : 2023-02-04
# * File Name     : mk_tools.sh
# * Description   : 
# **********************************************************

#mk tools
if $(command -v riscv64-unknown-linux-gnu-gcc > /dev/null)
then
       echo "RISCV tools were installed on host."
       TESLA_CROSS_COMPILE=riscv64-unknown-linux-gnu-
elif [ -f ${TESLA_CROSS_COMPILE}gcc ]
       echo "RISCV GNU tools were compiled and installed."
then
       echo "Installing the RISC-V tools"
      # GNU_TOOLS_INSTALL_PATH=${WORK_TESLA_PATH}/output/compiler
      # mkdir -p ${GNU_TOOLS_INSTALL_PATH}
       cd ${TESLA_GNU_TOOLS_REPO_PATH}
       ./configure --prefix=${GNU_TOOLS_INSTALL_PATH}
       make linux
       if [ $? -eq 0 ];then
               echo "compiler is ok"
       else
               echo "compiler is fail"
               rm ${GNU_TOOLS_INSTALL_PATH} -f
       fi
       make install
fi
