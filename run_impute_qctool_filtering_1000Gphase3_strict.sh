#!/bin/bash

impute_sap="imputation_p3/UBIOPREDAX_1000GP1.sample"

each_chr () {
	chr=$i
	impute_dir="imputation_p3/chr${chr}"
	chr_impute="$impute_dir/UBIOPREDAX_impute_chr${chr}.impute"
	chr_filter="$impute_dir/UBIOPREDAX_impute_chr${chr}_filter_strict.gen"
	chr_log="imputation_p3/UBIOPREDAX_impute_chr${chr}_qctool_strict.log"
	#chr_snpstat="imputation/UBIOPREDAX_impute_chr${chr}.snpstat"
	qctool -g "$chr_impute" -s "$impute_sap" -maf 0.05 0.5 -snp-missing-call-rate 0.005 -snp-missing-rate 0.05 -hwe 4 -info 0.95 1 -og $chr_filter -omit-chromosome >$chr_log
}

for i in $(seq 22);do
	each_chr $i
done
