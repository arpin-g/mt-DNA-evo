#!/bin/bash

if [ $# -lt 1 ]; then 
    echo "Usage: $0 vcf_file [vcf_file...]" 
    exit 1 
fi 
 
# Iterate over input VCF files 
for vcf_file in "$@"; do 
    # Check if VCF file exists 
    if [ ! -f "$vcf_file" ]; then 
        echo "Error: VCF file '$vcf_file' not found." 
        exit 1 
    fi 
    bgzip "$vcf_file"
    tabix -p vcf "$vcf_file.gz" 
done
