import os 
import sys
import shutil


def main():

    listd = os.listdir(DL)
    print(listd)

    for pdf in listd:
        if pdf.endswith("pdf"):
            base = os.path.basename(pdf)
            shutil.copy(f"{DL}/{pdf}", f"pdf_copy_py/{base}")
            print(base)

if __name__ == "__main__":
    DL = "../../Downloads"
    os.makedirs("pdf_copy_py", exist_ok=True)
    main()