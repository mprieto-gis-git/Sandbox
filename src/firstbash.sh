#!/bin/bash

dl="../../Downloads"


#ls $dl

mkdir -p pdf_copy

list=$(find $dl -name "*.pdf")

for pdf in ${list[@]}; do
    nm=$(basename $pdf)
    echo $nm
    cp -v $pdf "pdf_copy/new-${nm}"
done