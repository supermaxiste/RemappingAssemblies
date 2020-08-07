#!/usr/bin/env bash

# Important paths

Ahal=assemblies/Ahal_v2_2.fa
Alyr=assemblies/Alyr_v2_2.fa
JGI=assemblies/Alyrata_384_v1_only1-8.fa
AhalOutput=mapping/Ahal/lastal/
AlyrOutput=mapping/Alyr/lastal/

# Run the commands below to index the JGI genome
# If you already did it, skip them
lastdb -P 8 assemblies/JGIDb $JGI

# Alignment

mkdir mapping/Ahal/lastal
mkdir mapping/Alyr/lastal

lastal assemblies/JGIDb $Alyr > ${AlyrOutput}Alyr.maf
lastal assemblies/JGIDb $Ahal > ${AhalOutput}Ahal.maf

# Generate dict files needed to convert to paf format

samtools dict $Ahal > assemblies/Ahal_v2_2.dict
samtools dict $Alyr > assemblies/Alyr_v2_2.dict


# Convert maf to SAM

maf-convert sam -f assemblies/Alyr_v2_2.dict ${AlyrOutput}Alyr.maf > ${AlyrOutput}Alyr.sam
maf-convert sam -f assemblies/Ahal_v2_2.dict ${AhalOutput}Ahal.maf > ${AhalOutput}Ahal.sam

# Convert sam to paf

bioconvert sam2paf ${AlyrOutput}Alyr.sam ${AlyrOutput}Alyr.paf
bioconvert sam2paf ${AhalOutput}Ahal.sam ${AhalOutput}Ahal.paf

# Rename paf files for RagTag

mv ${AlyrOutput}Alyr.paf ${AlyrOutput}query_against_ref.paf
mv ${AhalOutput}Ahal.paf ${AhalOutput}query_against_ref.paf


# Now we set up variables folders and files for RagTag 

# New important paths

Ahal=../../assemblies/Ahal_v2_2.fa
Alyr=../../assemblies/Alyr_v2_2.fa
JGI=../../assemblies/Alyrata_384_v1_only1-8.fa
AhalOutput=../Ahal/
AlyrOutput=mapping/Alyr/

cd $AlyrOutput

ragtag.py scaffold $JGI $Alyr -o lastal

cd $AhalOutput

ragtag.py scaffold $JGI $Ahal -o lastal



