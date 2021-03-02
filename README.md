# Improving our assemblies

Since a couple of years, many shortcomings of our assemblies became clearer. Once of the biggest issues concerns spatial information, mainly caused by the huge number of scaffolds and no idea about their actual position along chromosomes. Because of that we'll try to use a chromosome-level assembly to reorder our assemblies accordingly. Given that we have no clue about accuracy, we will try three different mappers: `minimap2`, `mummer` and `lastal`.

# Before starting

 1) Unzip JGI assembly with `gzip -d assemblies/Alyrata_384_v1_only1-8.fa.gz`
 2) Add _A. halleri_ and _A. lyrata_ assemblies in `assemblies` folder. You can download them [here](https://www.ebi.ac.uk/ena/browser/view/GCA_900205625.1) and [here](https://www.ebi.ac.uk/ena/browser/view/GCA_900078215.1). Please rename the two assemblies to `Ahal_v2_2.fa` and `Alyr_v2_2.fa`. If you prefer other names, please modify all scripts in `scripts/` accordingly
 3) Install [Conda or miniconda3](https://docs.conda.io/projects/conda/en/latest/user-guide/install/) and run `conda create env -f envs/mappers.yaml -n mappers` to create a Conda environment with (almost) everything we need.
 4) Clone the `RagTag` github repository: `git clone https://github.com/malonge/RagTag.git`
 5) Activate `mappers` via `conda activate mappers` and install `RagTag` via `python setup.py install` (within the `RagTag` folder)

# To start

First activate `mappers` (if you didn't already) via `conda activate mappers`, then to run all analyses please stay on the `RemappingAssemblies/` folder and use:

```
sh scripts/minimap.sh
sh scripts/mummer.sh
sh scripts/lastal.sh
```
# Results

 In the `results` folder, for each method and each assembly, there is a `txt` file with different scores for each contig of our assembly. Another `agp` file provides information about the inferred location in the JGI assembly.
