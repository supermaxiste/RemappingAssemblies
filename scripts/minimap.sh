#!/usr/bin/env bash

# Important paths

Ahal=/srv/kenlab/stefan/assembly_mapping/assemblies/Ahal_v2_2.fa
Alyr=/srv/kenlab/stefan/assembly_mapping/assemblies/Alyr_v2_2.fa
JGI=/srv/kenlab/stefan/assembly_mapping/assemblies/Alyrata_384_v1_only1-8.fa
output=/srv/kenlab/stefan/assembly_mapping/mapping/minimap2/
ragtag=/srv/kenlab/stefan/phdProject/tools/RagTag/ragtag.py

cd $output

$ragtag scaffold $JGI $Alyr -t 8
$ragtag scaffold $JGI $Ahal -t 8





