#!/bin/bash

chr=$1

impute_dir="imputation/chr${chr}"

chr_len=$(awk 'NR=='"$chr"'{print $2}' chr_len_hg19.txt)
chunk_len=5000000
chunk_num=$((chr_len/chunk_len))
chunk_end=$((chr_len%chunk_len))
if test $chunk_end -gt 500000;then
	chunk_num=$((chunk_num+1))
fi

start_p=
end_p=

chr_impute=$impute_dir/UBIOPREDAX_impute_chr${chr}.impute
chr_impute_info=$impute_dir/UBIOPREDAX_impute_chr${chr}.impute_info

rm "$impute_dir/UBIOPREDAX_impute_chr.impute"
rm "$impute_dir/UBIOPREDAX_impute_chr.impute_info"

for i in $(seq $chunk_num);do
	if test $i -ne $chunk_num;then
		start_p=$(((i-1)*chunk_len+1))
		end_p=$((i*chunk_len))
	else
		start_p=$(((i-1)*chunk_len+1))
		end_p=$chr_len
	fi
	impute_file="$impute_dir/UBIOPREDAX_impute_chr${chr}_${start_p}_${end_p}.impute"
	impute_info="$impute_dir/UBIOPREDAX_impute_chr${chr}_${start_p}_${end_p}.impute_info"
	if test -f "$impute_file";then
		cat $impute_file >> $chr_impute
		sed '1d' $impute_info >> $chr_impute_info
	fi
done
