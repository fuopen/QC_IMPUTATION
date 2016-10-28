#!/bin/bash

for i in $(seq 22);do
	screen /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/run_impute_ctrunk_chr.sh $i >imputation/chr${i}_ctrunk.log
done
