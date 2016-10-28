#!/bin/bash

#for i in $(seq 22);do
#	plink --noweb --bfile plink_work/UBIOPREDAX_SNPs_QC --chr ${i} --make-bed --out phasing_p3/UBIOPREDAX_SHAPEIT_check_chr${i}
#	screen /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/run_shapeit_alignment_chr_1000Gphase3.sh $i
#done

for i in $(seq 22);do
	rm phasing_p3/UBIOPREDAX_SHAPEIT_check_chr${i}.*
	screen shapeit -B /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/phasing_p3/UBIOPREDAX_SHAPEIT_chr${i} -M /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/1000GP_Phase3/genetic_map_chr${i}_combined_b37.txt -O /home/sile/wd/project/UBIO-asthma/New_qc_ubio_800k/data_reannot/phasing_p3/UBIOPREDAX_SHAPEIT_phased_chr${i} --thread 4
done
