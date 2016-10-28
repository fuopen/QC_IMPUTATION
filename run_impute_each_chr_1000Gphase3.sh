#!/bin/bash

chr=$1

impute_dir="imputation_p3/chr${chr}"

if ! test -d "$impute_dir";then
	mkdir -p $impute_dir
fi

chr_len=$(awk 'NR=='"$chr"'{print $2}' chr_len_hg19.txt)
chunk_len=5000000
chunk_num=$((chr_len/chunk_len))
chunk_end=$((chr_len%chunk_len))
if test $chunk_end -gt 500000;then
	chunk_num=$((chunk_num+1))
fi

start_p=
end_p=


refg_dir="1000GP_Phase3"

for i in $(seq $chunk_num);do
	if test $i -ne $chunk_num;then
		start_p=$(((i-1)*chunk_len+1))
		end_p=$((i*chunk_len))
	else
		start_p=$(((i-1)*chunk_len+1))
		end_p=$chr_len
	fi
	impute2 \
	-use_prephased_g \
	-known_haps_g phasing_p3/UBIOPREDAX_SHAPEIT_phased_chr${chr}.haps	\
	-h ${refg_dir}/1000GP_Phase3_chr${chr}.hap.gz	\
	-l ${refg_dir}/1000GP_Phase3_chr${chr}.legend.gz	\
	-m ${refg_dir}/genetic_map_chr${chr}_combined_b37.txt	\
	-int $start_p $end_p	\
	-Ne 20000	\
	-k_hap 2000	\
	-buffer 500	\
	-o ${impute_dir}/UBIOPREDAX_impute_chr${chr}_${start_p}_${end_p}.impute
done
