#!/bin/bash
#SBATCH --job-name=parents-concat
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/concat_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/concat_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

cd /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/
module load bcftools

bcftools concat parents-chr1.vcf parents-chr2.vcf parents-chr3.vcf parents-chr4.vcf parents-chr5.vcf parents-chr6.vcf parents-chr7.vcf parents-chr8.vcf parents-chr9.vcf parents-chr10.vcf parents-chr11.vcf parents-chr12.vcf parents-chr13.vcf parents-chr14.vcf -Ov -o parents-ALLchr.vcf
