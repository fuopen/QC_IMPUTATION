#!/bin/bash

#for i in $(seq 22);do
#	plink --noweb --bfile plink_work/UBIOPREDAX_SNPs_QC --chr ${i} --make-bed --out phasing/UBIOPREDAX_SHAPEIT_check_chr${i}
#	screen /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/run_shapeit_alignment_chr.sh $i
#done

for i in $(seq 5 22);do
	rm phasing/UBIOPREDAX_SHAPEIT_check_chr${i}.*
	screen shapeit -B /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/phasing/UBIOPREDAX_SHAPEIT_chr${i} -M /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/ALL.integrated_phase1_SHAPEIT_16-06-14.nosing/genetic_map_chr${i}_combined_b37.txt -O /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/phasing/UBIOPREDAX_SHAPEIT_phased_chr${i} --thread 4
done
