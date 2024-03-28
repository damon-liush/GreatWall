#!/bin/bash

strings=("replaypc-0.4.0.preproc" "OpenTCP-1.0.4" "flex-2.5.31" "compiler"
        "libmspack" "unrarlib-0.4.0" "libpng-1.2.5" "mpeg2dec-0.3.1"
        "ttt-0.10.1.preproc" "zlib-1.1.4"
        "bzip2-1.0.2" "jpeg-6b" "teem-1.6.0-src" "lwip-0.5.3.preproc"
        "cg_compiler_opensrc" "mpgcut-1.1" "jikespg-1.3")

input_file="data.csv"

for str in "${strings[@]}"
do
        cat $1 | grep $str > $input_file
        sum=$(awk -F',' '{sum+=$3} END {print sum}' $input_file)
        echo "$str：$sum"
done
