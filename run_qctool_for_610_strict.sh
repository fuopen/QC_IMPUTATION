#!/bin/bash

impute_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/imputation_p3"
impute_sap="$impute_dir/UBIOPREDAX_1000GP1.sample"
outdir="$impute_dir/2million_snpstat"
each_chr () {
	chr=$i
	impute_chr_dir="$impute_dir/chr${chr}"
	chr_filter="$impute_chr_dir/UBIOPREDAX_impute_chr${chr}_filter_strict.gen"
	qctool -g "$chr_filter" -snp-stats "$outdir/chr${chr}.snpstat"
}

touch "$outdir/summary.txt"

for i in $(seq 22);do
	each_chr $i
	cat "$outdir/chr${i}.snpstat" >> "$outdir/summary.txt"
done
