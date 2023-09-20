The project aims to analyze human mitochondrial DNA to explore the genetic variation of the Armenian population and differences between Armenian and neighboring populations. 

Team:
- Arpine Griogoryan (arpigrigoryan1@gmail.com)
- Syuzi Matevosyan (syuzi.matevosyan1802@gmail.com)

Workflow:

0. Preprocessing

We downloaded fasta files of each sample with script scr/preprocessing/download_fasta.py
Data is stored in data_/samples

1. Alignment and Variant Annotation

For alignment and Variant Annotation, we used the CHLOROBOX public server (https://chlorobox.mpimp-golm.mpg.de). We stored annotated GFF3 files in /anno directory.

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
