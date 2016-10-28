#/bin/bash

impute_dir="imputation_p3"
outfile="$impute_dir/UBIOPREDAX_snpstat.tsv"
if test -f $outfile;then
	rm $outfile
	touch $outfile
fi

echo "chr	RSID	position	MAF	HWE	missing	missing_calls	information" > $outfile

for i in $(seq 22);do
	awk -v chr=$i -f extract_from_snpstat.awk $impute_dir/UBIOPREDAX_impute_chr${i}.snpstat >> $outfile
done
