#!/bin/bash
tissue=$1

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

expr_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/expr_data"
eqtl_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/eqtl_snp_p3"
impu_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/imputation_p3"

genfile="${eqtl_dir}/UBIOPREDAX_phase1.gen"

#if test -f $genfile;then
#	rm $genfile
#	touch $genfile
#else
#	touch $genfile
#fi

#for tissue in "blood";do
#for tissue in "blood" "sputum" "biopsy" "nabrush" "brbrush";do
#get_sample ${expr_dir}/${tissue}_eqtl_probe.txt ${eqtl_dir}/${tissue}_eqtl_sample.txt
for i in $(seq 22);do
##	each_trunk ${impu_dir}/chr$i/UBIOPREDAX_impute_chr${i}_filter.gen ${impu_dir}/UBIOPREDAX_1000GP1.sample ${eqtl_dir}/${tissue}_eqtl_sample.txt ${eqtl_dir}/${tissue}_eqtl_chr${i}.gen ${eqtl_dir}/${tissue}_eqtl_chr${i}.sample
##screen awk -f extract_snploc.awk -v chr=$i -v snp_loc_file="${eqtl_dir}/${tissue}_eqtl_snploc_chr${i}.txt" -v snp_file="${eqtl_dir}/${tissue}_eqtl_snp_chr${i}.txt" ${eqtl_dir}/${tissue}_eqtl_chr${i}.gen
	if test $i -eq 1;then
		echo "id" $(cat ${eqtl_dir}/${tissue}_eqtl_sample.txt) >> ${eqtl_dir}/${tissue}_eqtl_snp.txt
	fi
	cat ${eqtl_dir}/${tissue}_eqtl_snp_chr${i}.txt >>${eqtl_dir}/${tissue}_eqtl_snp.txt
	cat ${eqtl_dir}/${tissue}_eqtl_snploc_chr${i}.txt >>${eqtl_dir}/${tissue}_eqtl_snploc.txt
done
#done
