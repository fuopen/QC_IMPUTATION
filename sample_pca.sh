#!/bin/bash

plink --noweb --bfile UBIOPREDAX  --extract snp_preserve_by_LD.list --maf 0.025 --geno 0.015 --indep-pairwise 1000 100 0.1 --make-bed --out UBIOPREDAX_SNPs_SAMPLE_Filter >ubiopred_snp_sample_filter.log 2>&1
