#!/bin/bash

#plink --noweb --bfile UBIOPREDAX --check-sex --out UBIOPREDAX_checksex

#plink --noweb --bfile UBIOPREDAX --extract UBIOPREDAX_autosome_rs_snpid.txt --keep UBIOPREDAX_sample_pass_1st.list --make-bed --out UBIOPREDAX_QC_autosome_rs

#plink --noweb --bfile UBIOPREDAX_QC_autosome_rs  --exclude exclude_by_high_ld.txt --range --geno 0.015 --maf 0.025 --make-bed --out UBIOPREDAX_QC1

#plink --noweb --bfile UBIOPREDAX_QC1 --indep-pairwise 1000 100 0.1 --out prune_by_ld_missing_maf

#plink --noweb --bfile UBIOPREDAX_QC1 --extract prune_by_ld_missing_maf.prune.in --make-bed --out UBIOPREDAX_628_pruned

#awk -f remove_strand.awk UBIOPREDAX_628_pruned.bim > remove_indels.list

#plink --noweb --bfile UBIOPREDAX_628_pruned --extract remove_indels.list --make-bed --out UBIOPREDAX_ceu_pca

#flashpca --bfile UBIOPREDAX_ceu_pca --numthreads 10 --ndim 20

#plink --noweb --bfile UBIOPREDAX_ceu_pca --remove remove_ceu_pca_outlier.txt --make-bed --out UBIOPREDAX_filtering_by_pca 

#plink --noweb --bfile UBIOPREDAX --missing --out UBIOPREDAX_missing

#plink --noweb --bfile UBIOPREDAX --het --out UBIOPREDAX_het

#plink --noweb --bfile UBIOPREDAX --homozyg-kb 1000 --out UBIOPREDAX_homozyg

#plink --noweb --bfile UBIOPREDAX --keep sp_remove_outlier_610.txt --make-bed --out UBIOPREDAX_kinship

#king -b UBIOPREDAX_kinship.bed --kinship

#plink --noweb --bfile UBIOPREDAX_kinship --exclude exclude_by_high_ld.txt --range --indep-pairwise 50 5 0.2 --out UBIOPREDAX_IBS

#plink --noweb --bfile UBIOPREDAX_kinship --extract UBIOPREDAX_IBS.prune.in --genome --out UBIOPREDAX_plink_IBS

#awk -f remove_non_autosome_indels.awk UBIOPREDAX.bim >auto_snps.list

#cut -f1 auto_snps.list|uniq -c|sed 's/^ \{1,\}//g'|sort -rk1|awk '{if($1<3){print $0}}' >auto_snps_keep_list.info

#awk '{print $2}' auto_snps_keep_list.info > auto_snps_keep.list

#awk '{if($1==2){print $2}}' auto_snps_keep_list.info > auto_snps_exclude_dup.list

#plink --noweb --bfile UBIOPREDAX --keep sp_remove_outlier_610.txt --extract auto_snps_keep.list --make-bed --out UBIOPREDAX_auto_dup2

#plink --noweb --bfile UBIOPREDAX_auto_dup2 --exclude auto_snps_exclude_dup.list --make-bed --out UBIOPREDAX_auto_rm_dup

#plink --noweb --bfile UBIOPREDAX_auto_rm_dup --missing --out UBIOPREDAX_Marker_QC_missing

plink --noweb --bfile UBIOPREDAX_auto_rm_dup --maf 0.01 --geno 0.05 --hwe 0.00001 --make-bed --out UBIOPREDAX_SNPs_QC
