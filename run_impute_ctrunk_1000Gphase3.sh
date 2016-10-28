#!/bin/bash

for i in $(seq 22);do
	/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/run_impute_ctrunk_chr_1000Gphase3.sh $i >imputation_p3/chr${i}_ctrunk.log
done
