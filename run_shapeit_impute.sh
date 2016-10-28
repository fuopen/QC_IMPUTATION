#!/bin/bash

i=22

shapeit 

awk 'NR>1{print $4}' check_test${i}.alignments.snp.strand >mismatch_filtering_${i}.txt

plink --noweb --bfile test_shapeit --exclude mismatch_filtering_${i}.txt --make-bed --out UBIOPREDAX_SHAPEIT_chr${i}

shapeit -check -B UBIOPREDAX_SHAPEIT_chr${i} --input-ref ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.chr22.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.haplotypes.gz ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.chr22.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.legend.gz ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.sample --output-log filter_chr${i}.alignments
