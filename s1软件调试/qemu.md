# qemu dtb的导入以及导出
qemu-system-aarch64  -cpu cortex-a53 -smp 4 -machine virt,dumpdtb=qemu.dtb
dtc -I dtb qemu.dtb -O dts -o qemu.dts
dtc -O dtb  -I dts qemu.dts -o qemu.dtb


