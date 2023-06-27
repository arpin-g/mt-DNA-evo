#!/bin/bash

mkdir ~/Desktop/ethnogenomics/mitogenome_analysis/combined
mkdir ~/Desktop/ethnogenomics/mitogenome_analysis/combined/trees

for var in `ls ~/Desktop/ethnogenomics/mitogenome_analysis/data_1/prots`
do
  	find ~/Desktop/ethnogenomics/mitogenome_analysis -type f -name $var -exec cat {} + > ~/Desktop/ethnogenomics/mitogenome_analysis/combined/$var.combined
	echo "Fasta combinig of" $var "is done!"
	mafft --auto --inputorder ~/Desktop/ethnogenomics/mitogenome_analysis/combined/$var.combined > ~/Desktop/ethnogenomics/mitogenome_analysis/combined/$var.msa.combined
	echo "MSA of" $var "is done!"
	~/tools/FastTree -nt ~/Desktop/ethnogenomics/mitogenome_analysis/combined/$var.msa.combined > ~/Desktop/ethnogenomics/mitogenome_analysis/combined/trees/$var.combined.tree.nwk
	echo "Tree of" $var "is built!"

done

