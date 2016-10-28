#!/bin/bash
tissue=$1
sample_id="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/eqtl_snp_prune_p3/eqtl_sample_id.txt"

get_sample () {
	ifile=$1
	ofile=$2
	head -n1 $ifile |tr " " "\n"|sed 1d > $ofile
}

each_trunk () {
	gen_file=$1
	sap_file=$2
	inc_file=$3
	ogfile=$4
	osfile=$5
	qctool -g $gen_file -s $sap_file -incl-samples $inc_file -og $ogfile -os $osfile
}

#expr_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/expr_data"
eqtl_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/eqtl_snp_prune_p3"
impu_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/imputation_p3"


#for tissue in "blood" "sputum" "biopsy" "nabrush" "brbrush";do
##get_sample ${expr_dir}/${tissue}_eqtl_probe.txt ${eqtl_dir}/${tissue}_eqtl_sample.txt
gen_file="$eqtl_dir/Meta-tissues/all_sample.gen"
eqtlgen_file="$eqtl_dir/Meta-tissues/eqtl_sample.gen"
eqtlsap_file="$eqtl_dir/Meta-tissues/eqtl_sample.sample"
touch $gen_file
for i in $(seq 22);do
	cat ${impu_dir}/chr$i/UBIOPREDAX_impute_chr${i}_filter_strict.gen >>$gen_file
done
for i in $(seq 22);do
	gtool -S --g $gen_file --s ${impu_dir}/UBIOPREDAX_1000GP1.sample --og $eqtlgen_file --os $eqtlsap_file --sample_id $sample_id
#each_trunk ${impu_dir}/chr$i/UBIOPREDAX_impute_chr${i}_filter_strict.gen ${impu_dir}/UBIOPREDAX_1000GP1.sample ${eqtl_dir}/${tissue}/${tissue}_eqtl_sample.txt ${eqtl_dir}/${tissue}/${tissue}_eqtl_chr${i}_strict.gen ${eqtl_dir}/${tissue}/${tissue}_eqtl_chr${i}_strict.sample
#screen awk -f extract_snploc.awk -v chr=$i -v snp_loc_file="${eqtl_dir}/${tissue}/${tissue}_eqtl_snploc_chr${i}_strict.txt" -v snp_file="${eqtl_dir}/${tissue}/${tissue}_eqtl_snp_chr${i}_strict.txt" ${eqtl_dir}/${tissue}/${tissue}_eqtl_chr${i}_strict.gen
#if test $i -eq 1;then
#		echo "id" $(cat ${eqtl_dir}/${tissue}/${tissue}_eqtl_sample.txt) >> ${eqtl_dir}/${tissue}/${tissue}_eqtl_snp2.txt
#	fi
#	cat ${eqtl_dir}/${tissue}/${tissue}_eqtl_snp_chr${i}_strict.txt >>${eqtl_dir}/${tissue}/${tissue}_eqtl_snp2.txt
#	cat ${eqtl_dir}/${tissue}/${tissue}_eqtl_snploc_chr${i}_strict.txt >>${eqtl_dir}/${tissue}/${tissue}_eqtl_snploc2.txt
done
