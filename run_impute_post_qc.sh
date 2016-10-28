#!/bin/bash

impute_sap="imputation/UBIOPREDAX_1000GP1.sample"

each_chr () {
	chr=$i
	impute_dir="imputation/chr${chr}"
	chr_impute="$impute_dir/UBIOPREDAX_impute_chr${chr}.impute"
	chr_snpstat="imputation/UBIOPREDAX_impute_chr${chr}.snpstat"
	qctool -g "$chr_impute" -s "$impute_sap" -snp-stats "$chr_snpstat"
}

for i in $(seq 22);do
	each_chr $i
done
