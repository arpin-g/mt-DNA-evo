The project aims to analyze human mitochondrial DNA to explore genetic variation of Armenian popoulation and differencies between Armenian and neighbouring populations. 

Team:
- Arpine Griogoryan (arpigrigoryan1@gmail.com)
- Syuzi Matevosyan (syuzi.matevosyan1802@gmail.com)

Workflow:

0. Preprocessing

We downoladed fasta files of each sample with script scr/preprocessing/download_fasta.py
Data is stored in mt_fastas/samples

1. Alignment and Variant Calling

For alignment we used BWA (Version: 0.7.17-r1188) with scr/preprocessing/alignment.sh script and rCRS as reference genome (NC_012920). Script performs alignment, stores in /sam, then variant calling for each sample. For variant calling we used BCFtools call (Version: 1.16) and stores VCFs in vcfs/ directory.

2. Variant Annotation

Variant annotation was done using snpEff (Version: 5.1d). At first we built a library for human mitochondria, using gff3 file obtained from GenBank. After proceeded with script scr/annotation.sh . Stored annotated VCF files in /anno directory.

3. Defining Haplogroups

Haplogroups were defined using HaploGrep (Version 3.0) web server (https://haplogrep.i-med.ac.at/). Downloaded results as zip (haplogroups.zip)

Data #1:
Paper: Derenko et al. (2019) Insights into matrilineal genetic structure, diferentiation and ancestry of Armenians based on complete mitogenome data
https://doi.org/10.1007/s00438-019-01596-2

Samples: Complete human mitogenomes, GenBank accession numbers: MK491355–MK491495

Data #2 
Paper: Derenko, M. et al. (2013). Complete mitochondrial DNA diversity in Iranians. 
(355 Iranian,Kurd,Russian,Qashqai mtDNAs)
https://doi.org/10.1371/journal.pone.0080673 

Data #3 
Paper: Schoenberg,A., Theunert,C., Li,M., Stoneking,M. and Nasidze,I. (2011) High-throughput sequencing of complete human mtDNA genomes from the Caucasus and West Asia: high diversity and demographic inferences. 
doi: 10.1038/ejhg.2011.62

Data #4
Paper: Ashot Margaryan, Miroslava Derenko (2017) Eight Millennia of Matrilineal Genetic Continuity in the South Caucasus
http://dx.doi.org/10.1016/j.cub.2017.05.087

4. Extracting coding sequences
Transforming gff3 genome annotation file from NCBI (https://www.ncbi.nlm.nih.gov/nuccore/NC_012920.1/) to bed file using Bedops gff2bed (https://github.com/bedops/bedops), extracting only protein-coding regions, extracting protein-coding sequences using Bedtools. 

5. Building a phylogenetic tree


