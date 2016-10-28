#!/bin/bash

plink --noweb --bfile UBIOPREDAX --extract pruned_snp.list --recode --out UBIOPREDAX_355_samples

