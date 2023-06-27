#!/bin/bash

#1 $1- data_1, data_2..

#the naxord takes the value of chromosome name in region bed file
naxord="`awk -F '.' '{print $1; exit}' ~/Desktop/ethnogenomics/mitogenome_analysis/reference/prot_cds.bed`"

cd ~/Desktop/ethnogenomics/mitogenome_analysis/$1
tar -zxf fasta_samples.tar.gz

for var in `ls ~/Desktop/ethnogenomics/mitogenome_analysis/$1/samples`
do
  	basepart=$(basename "$var" .${var##*.})
        echo $basepart >> ~/Desktop/ethnogenomics/mitogenome_analysis/$1/ls.txt
done

mkdir ~/Desktop/ethnogenomics/mitogenome_analysis/$1/cds

#iterating through samples' basenames -> changing the chromosome name in region bed file -> extracting coding regions -> saving in cds/ 
while IFS= read -r basepart; do
	#echo $basepart
	current=$basepart
	sed -i s/$naxord/$current/g ~/Desktop/ethnogenomics/mitogenome_analysis/reference/prot_cds.bed
	bedtools getfasta -fi ~/Desktop/ethnogenomics/mitogenome_analysis/$1/samples/$current.fasta -bed ~/Desktop/ethnogenomics/mitogenome_analysis/reference/prot_cds.bed -fo ~/Desktop/ethnogenomics/mitogenome_analysis/$1/cds/$current.cds.fasta 
	naxord=$basepart
done < ~/Desktop/ethnogenomics/mitogenome_analysis/$1/ls.txt
rm -r ~/Desktop/ethnogenomics/mitogenome_analysis/$1/samples

mkdir ~/Desktop/ethnogenomics/mitogenome_analysis/$1/prots
mkdir ~/Desktop/ethnogenomics/mitogenome_analysis/$1/trees

echo "Extracting Done!"
#iterating through start loci -> finding the corresponding protein by its' start site from each sample and combining it into one file -> 
# -> performing multiple sequence alignment -> building a tree based on each proteins MSA

while IFS= read -r start; do
echo $start
cd ~/Desktop/ethnogenomics/mitogenome_analysis/$1/cds/
cat * > combined.cds.fasta
grep -A 1 $start combined.cds.fasta | grep -v "^--$" > ~/Desktop/ethnogenomics/mitogenome_analysis/$1/prots/$start.fasta
mafft --auto --inputorder ~/Desktop/ethnogenomics/mitogenome_analysis/$1/prots/$start.fasta > ~/Desktop/ethnogenomics/mitogenome_analysis/$1/prots/$start.msa.fasta
echo "MSA of" $start "is done!"
~/tools/FastTree -nt ~/Desktop/ethnogenomics/mitogenome_analysis/$1/prots/$start.msa.fasta > ~/Desktop/ethnogenomics/mitogenome_analysis/$1/trees/$start.tree.nwk
done < ~/Desktop/ethnogenomics/mitogenome_analysis/scr/starts.txt
