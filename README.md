# Improving our assemblies

Since a couple of years, many shortcomings of our assemblies became clearer. Once of the biggest issues concerns spatial information, mainly caused by the huge number of scaffolds and no idea about their actual position along chromosomes. Because of that we'll try to use a chromosome-level assembly to reorder our assemblies accordingly. Given that we have no clue about accuracy, we will try three different mappers: `minimap2`, `mummer` and `lastal`.

# Before starting

 * Unzip JGI assembly with `gzip -d assemblies/Alyrata_384_v1_only1-8.fa.gz`
 * Add _A. halleri_ and _A. lyrata_ assemblies in `assemblies` folder. Their filenames are defaulted to `Ahal_v2_2.fa` and `Alyr_v2_2.fa`. If you prefer other names, please modify all scripts in `scripts/` accordingly
 * Run `conda create env -f envs/mappers.yaml -n mappers` to create a Conda environment with (almost) everything we need
 * Clone the `RagTag` github repository: `git clone https://github.com/malonge/RagTag.git`
 * Activate `mappers` via `conda activate mappers` and install `RagTag` via `python setup.py install` (within the `RagTag` folder) 
