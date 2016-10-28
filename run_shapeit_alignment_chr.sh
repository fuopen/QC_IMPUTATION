#!/bin/bash

i=$1
 
shapeit -check -B phasing/UBIOPREDAX_SHAPEIT_check_chr${i} --input-ref ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.chr${i}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.haplotypes.gz ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.chr${i}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.legend.gz ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.sample --output-log phasing/check_test_chr${i}.alignments

awk 'NR>1{print $4}' phasing/check_test_chr${i}.alignments.snp.strand >phasing/mismatch_filtering_${i}.txt

plink --noweb --bfile phasing/UBIOPREDAX_SHAPEIT_check_chr${i} --exclude phasing/mismatch_filtering_${i}.txt --make-bed --out phasing/UBIOPREDAX_SHAPEIT_chr${i}

shapeit -check -B phasing/UBIOPREDAX_SHAPEIT_chr${i} --input-ref ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.chr${i}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.haplotypes.gz ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.chr${i}.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.nosing.legend.gz ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/ALL.integrated_phase1_v3.20101123.snps_indels_svs.genotypes.sample --output-log phasing/filter_chr${i}.alignments
