#!/bin/bash

#plink2 --bfile UBIOPREDAX --check-sex --out UBIOPREDAX_checksex

#plink2 --bfile UBIOPREDAX --extract UBIOPREDAX_autosome_rs_snpid.txt --keep UBIOPREDAX_sample_pass_1st.list --make-bed --out UBIOPREDAX_QC_autosome_rs

#plink2 --bfile UBIOPREDAX_QC_autosome_rs  --exclude exclude_by_high_ld.txt --range --geno 0.015 --maf 0.025 --make-bed --out UBIOPREDAX_QC1

#plink2 --bfile UBIOPREDAX_QC1 --indep-pairwise 1000 100 0.1 --out prune_by_ld_missing_maf

#plink2 --bfile UBIOPREDAX_QC1 --extract prune_by_ld_missing_maf.prune.in --make-bed --out UBIOPREDAX_628_pruned

#awk -f remove_strand.awk UBIOPREDAX_628_pruned.bim > remove_indels.list

#plink2 --bfile UBIOPREDAX_628_pruned --extract remove_indels.list --make-bed --out UBIOPREDAX_ceu_pca

#flashpca --bfile UBIOPREDAX_ceu_pca --numthreads 10 --ndim 20

#plink2 --bfile UBIOPREDAX_ceu_pca --remove remove_ceu_pca_outlier.txt --make-bed --out UBIOPREDAX_filtering_by_pca 

#plink2 --bfile UBIOPREDAX --missing --out UBIOPREDAX_missing

#plink2 --bfile UBIOPREDAX --het --out UBIOPREDAX_het

#plink2 --bfile UBIOPREDAX --homozyg-kb 1000 --out UBIOPREDAX_homozyg

#plink2 --bfile UBIOPREDAX --keep sp_remove_outlier_610.txt --make-bed --out UBIOPREDAX_kinship

#king -b UBIOPREDAX_kinship.bed --kinship

#plink2 --bfile UBIOPREDAX_kinship --exclude exclude_by_high_ld.txt --range --indep-pairwise 50 5 0.2 --out UBIOPREDAX_IBS

#plink2 --bfile UBIOPREDAX_kinship --extract UBIOPREDAX_IBS.prune.in --genome --out UBIOPREDAX_plink2_IBS

####plink2 --bfile UBIOPREDAX --snps-only --make-bed --out UBIOPREDAX_snponly

awk -f remove_non_autosome_indels.awk UBIOPREDAX.bim > auto_snps.list


