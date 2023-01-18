# gdb调试

## 多线程调试命令

info threads - 显示所有线程信息

thread ID - 切换到ID对应的线程

set scheduler-locking on - 只运行当前线程

set scheduler-locking off - 所有线程并发执行

## gdbmacros

file vmlinux

source gdbmacros.txt

dmesg


