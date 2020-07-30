#!/usr/bin/env bash

# Important paths

Ahal=../../assemblies/Ahal_v2_2.fa
Alyr=../../assemblies/Alyr_v2_2.fa
JGI=../../assemblies/Alyrata_384_v1_only1-8.fa
AhalOutput=../Ahal/
AlyrOutput=mapping/Alyr/

cd $AlyrOutput

ragtag.py scaffold $JGI $Alyr -t 8 -o minimap2

cd $AhalOutput

ragtag.py scaffold $JGI $Ahal -t 8 -o minimap2





