#!/bin/bash
#SBATCH --job-name=gatk-filter2
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=5:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/vcftools2_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/vcftools2_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bio/vcftools
vcftools --vcf /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-ALLchr-filteredsnps.vcf --max-missing 0.25 --remove-filtered-all --minQ 500  --recode --recode-INFO-all --min-alleles 2 --max-alleles 2 --out /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-ALLchr-filteredsnps3.vcf
