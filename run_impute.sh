#/bin/bash

for i in $(seq 21);do
	/home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/run_impute_each_chr.sh $i >imputation/chr${i}.log &
done
