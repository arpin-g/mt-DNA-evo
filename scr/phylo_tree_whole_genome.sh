#!/bin/bash
###iterating through data and combining fasta samples into one
for var in `ls ~/Desktop/ethnogenomics/mitogenome_analysis/data`
do
	cd ~/Desktop/ethnogenomics/mitogenome_analysis/data/$var
	tar -zxf fasta_samples.tar.gz
	cat samples/* > $var.fasta
	mv $var.fasta ~/Desktop/ethnogenomics/mitogenome_analysis/combined
        echo "Combaining of " $var " is done" 
	rm -r samples
done

### combining everything and performing multiple sequence alignment -> building a phylogenetic tree based on whole genome data 
cd ~/Desktop/ethnogenomics/mitogenome_analysis/combined
cat data_1.fasta data_2.fasta data_3.fasta data_4.fasta > wg.fasta
mafft --auto --inputorder wg.fasta > wg.msa.fasta
echo "MSA of combined done!"
~/tools/FastTree -nt wg.msa.fasta > trees/wg_across_all_data.tree.nwk
echo "Successfully done!"
