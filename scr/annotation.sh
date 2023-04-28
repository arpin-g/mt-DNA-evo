#!/bin/bash

for var in `ls ../vcfs/` 
do
  	basepart=$(basename "$var" .${var##*.})
        echo $basepart
	cd ~/tools/snpEff
	java -jar snpEff.jar NC_012920.1 ../../Desktop/ethnogenomics/vcfs/$var > ../../Desktop/ethnogenomics/anno/$basepart.anno.vcf
done
