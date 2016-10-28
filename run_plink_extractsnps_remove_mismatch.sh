#!/bin/bash

plink --noweb --bfile UBIOPREDAX --extract shellfish_mismatch_prune.list --recode --out UBIOPREDAX_355_samples_rm_mismatch

