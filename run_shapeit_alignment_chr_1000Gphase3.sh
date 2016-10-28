#!/bin/bash

i=$1
 
shapeit -check -B phasing_p3/UBIOPREDAX_SHAPEIT_check_chr${i} --input-ref 1000GP_Phase3/1000GP_Phase3_chr${i}.hap.gz 1000GP_Phase3/1000GP_Phase3_chr${i}.legend.gz 1000GP_Phase3/1000GP_Phase3.sample --output-log phasing_p3/check_test_chr${i}.alignments

awk 'NR>1{print $4}' phasing_p3/check_test_chr${i}.alignments.snp.strand >phasing_p3/mismatch_filtering_${i}.txt

plink --noweb --bfile phasing_p3/UBIOPREDAX_SHAPEIT_check_chr${i} --exclude phasing_p3/mismatch_filtering_${i}.txt --make-bed --out phasing_p3/UBIOPREDAX_SHAPEIT_chr${i}

shapeit -check -B phasing_p3/UBIOPREDAX_SHAPEIT_chr${i} --input-ref 1000GP_Phase3/1000GP_Phase3_chr${i}.hap.gz 1000GP_Phase3/1000GP_Phase3_chr${i}.legend.gz 1000GP_Phase3/1000GP_Phase3.sample --output-log phasing_p3/filter_chr${i}.alignments
