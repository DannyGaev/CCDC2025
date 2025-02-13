import os

confirmation = False
os_es = ["Windows","Linux","Unsure"]
print("[!] DISCLAIMER: THIS IS NOT (YET) A COMPREHENSIVE LIST OF FILES & FOLDERS; ASK A TEAMATE TO CONFIRM IF A FILE IS SUSPICIOUS OR NOT!\n")
while not confirmation:
    filename = input("Enter the name of the file you are suspicious of: ")
    operating_system = input("Enter the number corresponding to the operating system on which the file was found\n\t[1] Windows\n\t[2] Linux\n\t[3] Unsure\n: ")
    confirm = input(f"\nPlease confirm this is the information you are looking for (YES [1] / NO [2]): \n\tFILENAME: {filename}\n\tOS: {os_es[int(operating_system)-1]}\n: ")
    if confirm == "1":
        confirmation = True
    else: print("\n")

top_dir = os.getcwd()
if operating_system=="1":
    on_general = True
    on_ccdc = True
    os.chdir("windows")
    with open("expected_windows_files.txt","r",encoding="utf8") as r:
        data = r.readlines()

    no_duplicates = []
    for item in data:
        if item.strip() not in no_duplicates:
            no_duplicates.append(item.strip())

    if filename in no_duplicates:
        print("\n[*] The file/folder is expected to be on Windows installations in general.")
    else:
        on_general = False

    with open("only_on_ccdc_windows_files.txt","r",encoding="utf8") as r:
        data = r.readlines()

    no_duplicates = []
    for item in data:
        if item.strip() not in no_duplicates:
            no_duplicates.append(item.strip())

    if filename in no_duplicates:
        print("\n[*] The file/folder is expected to only be on CCDC Windows installations.")
    else:
        on_ccdc = False

    if not on_ccdc and not on_general:
        print("\n[!] WARNING: FILE/FOLDER IS NOT EXPECTED TO APPEAR ON EITHER GENERAL OR CCDC INSTALLATIONS OF WINDOWS, AND IS MORE LIKELY TO BE MALICIOUS.")
    
    os.chdir(top_dir)