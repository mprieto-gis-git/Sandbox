import sys
import geopandas as gp

def main():

    gdf = gp.read_file(SHP)

    for frame in gdf["frm_file"]:
        print(frame)

if __name__ == "__main__":

    SHP = sys.argv[1]

    main()