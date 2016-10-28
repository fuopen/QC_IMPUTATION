#!/bin/bash

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
eqtl_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/eqtl_snp"
impu_dir="/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/imputation"

genfile="${eqtl_dir}/UBIOPREDAX_phase1.gen"

if test -f $genfile;then
	rm $genfile
	touch $genfile
else
	touch $genfile
fi

for tissue in "blood";do
#for tissue in "blood" "sputum" "biopsy" "nabrush" "brbrush";do
	get_sample ${expr_dir}/${tissue}_eqtl_probe.txt ${eqtl_dir}/blood_eqtl_sample.txt
	for i in $(seq 22);do
		each_trunk ${impu_dir}/chr$i/UBIOPREDAX_impute_chr${i}_filter.gen ${impu_dir}/UBIOPREDAX_1000GP1.sample ${eqtl_dir}/blood_eqtl_sample.txt ${eqtl_dir}/blood_eqtl_test.gen ${eqtl_dir}/blood_eqtl_test.sample
	done
done
