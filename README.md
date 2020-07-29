# Improving our assemblies

Since a couple of years, many shortcomings of our assemblies became clearer. Once of the biggest issues concerns spatial information, mainly caused by the huge number of scaffolds and no idea about their actual position along chromosomes. Because of that we'll try to use a chromosome-level assembly to reorder our assemblies accordingly. Given that we have no clue about accuracy, we will try three different mappers: `minimap2`, `mummer` and `lastal`.
