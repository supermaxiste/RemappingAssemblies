#!/usr/bin/env bash

# Important paths

Ahal=assemblies/Ahal_v2_2.fa
Alyr=assemblies/Alyr_v2_2.fa
JGI=assemblies/Alyrata_384_v1_only1-8.fa
AhalOutput=mapping/Ahal/lastal/
AlyrOutput=mapping/Alyr/lastal/

# Run the commands below to index genomes
# If you already did it, skip them
lastdb -P 8 assemblies/AlyrDb $Alyr
lastdb -P 8 assemblies/AhalDb $Ahal

# Alignment

mkdir mapping/Ahal/lastal
mkdir mapping/Alyr/lastal

lastal assemblies/AlyrDb $JGI > ${AlyrOutput}Alyr.maf
lastal assemblies/AhalDb $JGI > ${AhalOutput}Ahal.maf

# Generate dict files needed to convert to paf format

samtools dict $Ahal > assemblies/Ahal_v2_2.dict
samtools dict $Alyr > assemblies/Alyr_v2_2.dict


# Convert maf to SAM

maf-convert sam -f assemblies/Alyr_v2_2.dict ${AlyrOutput}Alyr.maf > ${AlyrOutput}Alyr.sam
maf-convert sam -f assemblies/Ahal_v2_2.dict ${AhalOutput}Ahal.maf > ${AhalOutput}Ahal.sam

# Convert sam to paf

bioconvert sam2paf ${AlyrOutput}Alyr.sam ${AlyrOutput}Alyr.paf
bioconvert sam2paf ${AhalOutput}Ahal.sam ${AhalOutput}Ahal.paf





