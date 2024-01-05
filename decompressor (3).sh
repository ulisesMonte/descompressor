#!/bin/bash
 
function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  exit 1
}

# Ctrl+C
trap ctrl_c INT

first_file_name="" # write the name of de zip 
decompressed_file_name="$(7z l "" | tail -n 3 | head -n 1 | awk 'NF{print $NF}')" #then of l yyou must put de name of the firse_file_name

7z x $first_file_name &>/dev/null

while [ $decompressed_file_name ]; do
  echo -e "\n[+] Nuevo archivo descomprimido: $decompressed_file_name"
  7z x $decompressed_file_name &>/dev/null
  decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
done
