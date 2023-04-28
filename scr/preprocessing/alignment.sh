#!/bin/bash

#preprocessing steps. alignment of reads to the reference genome
for var in `ls ../mt_fastas/samples/` 
do
	basepart=$(basename "$var" .${var##*.})
	echo $basepart  
        bwa mem ../mt_fastas/mt_ref.fasta ../mt_fastas/samples/$var >../sam/$basepart.sam 
	samtools view -bS ../sam/$basepart.sam > ../sam/$basepart.bam
	#variant calling  
	bcftools mpileup -B -Ou --ignore-RG -f ../mt_fastas/mt_ref.fasta ../sam/$basepart.bam \
	| bcftools call --ploidy 1 -vmO z -o ../vcfs/$basepart.vcf.gz 
done
