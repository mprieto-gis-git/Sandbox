#!/bin/bash

#in="/mnt/apprapd007/hap_rect/Charleville_1993_120cm_RHAP/output/ortho_tif_mosaic_rgb/orthomosaic_Charleville_1993_120cm_RHAP.tif"
in=$1

out="data/testfootprint.shp"

gdal_footprint -overwrite $in $out