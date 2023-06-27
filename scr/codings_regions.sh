#! /bin/bash

gff2bed < /home/arpine/Desktop/ethnogenomics/mitogenome_analysis/reference/sequence.gff3 \
| grep CDS > /home/arpine/Desktop/ethnogenomics/mitogenome_analysis/reference/prot.bed

bedtools getfasta \
 -fi Desktop/ethnogenomics/mitogenome_analysis/reference/mt_ref.fasta \
 -bed Desktop/prot_cds.bed \
 -fo /home/arpine/Desktop/ethnogenomics/mitogenome_analysis/reference/pcs_ref.fasta


