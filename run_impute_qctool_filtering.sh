#!/bin/bash

impute_sap="imputation/UBIOPREDAX_1000GP1.sample"

each_chr () {
	chr=$i
	impute_dir="imputation/chr${chr}"
	chr_impute="$impute_dir/UBIOPREDAX_impute_chr${chr}.impute"
	chr_filter="$impute_dir/UBIOPREDAX_impute_chr${chr}_filter.gen"
	chr_log="imputation/UBIOPREDAX_impute_chr${chr}_qctool.log"
	#chr_snpstat="imputation/UBIOPREDAX_impute_chr${chr}.snpstat"
	qctool -g "$chr_impute" -s "$impute_sap" -maf 0.01 0.5 -snp-missing-rate 0.05 -hwe 5 -info 0.8 1 -og $chr_filter -omit-chromosome >$chr_log
}

for i in $(seq 22);do
	each_chr $i
done
