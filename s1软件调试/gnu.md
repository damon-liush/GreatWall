# GNU Tools

## readelf

readelf -l demobin | grep ld - find executable link file  
readelf -d demobin - find dependent library files

## gcc

gcc test.c -E - generate preprocessed file  
gcc test.c -S - generate asm file

## Makefile

生成所有临时文件：添加-save-temps标志，KBUILD_AFLAGS += -save-temps
KBUILD_CFLAGS += -save-temps


