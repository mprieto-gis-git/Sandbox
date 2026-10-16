import os 
import sys
import shutil
import geopandas as gp

def main():

    gp_file = gp.read_file(SHP)
    print(gp_file)

    diss = gp_file.dissolve()
    print(diss)

    buff = diss.buffer(-100)
    print(buff)

    buff.to_file('data/buffer.shp', driver = "ESRI Shapefile")

if __name__ == "__main__":
    #SHP = "/mnt/apprapd007/hap_rect/Charleville_1993_120cm_RHAP/output/metadata/seamlines/seamlines-Charleville_1993_120cm_RHAP.shp"
    SHP = sys.argv[1]
    os.makedirs("data", exist_ok=True)
    main()