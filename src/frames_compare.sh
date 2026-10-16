#!/bin/bash

project="/mnt/apprapd007/hap_rect/${1}"
outdir="${project}/unused_files"
frm=$outdir/frm_file.txt
folder=$outdir/folder_names.txt

mkdir -p $outdir

echo "Running from ${project}"
python3 read_frm_file.py ${project}/output/metadata/seamlines/seamlines-$(basename $project).shp > $frm

echo "Running from frames_clipped"
ls ${project}/frames_clipped/*.jpg \
| xargs -n1 basename \
| sed 's/\.jpg$//' \
> $folder

echo "Comparing lists"
grep -vxFf $frm $folder > $outdir/missing.txt