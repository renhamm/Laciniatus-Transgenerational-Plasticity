#!/bin/bash
#SBATCH --job-name=bcftools-isec
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=5:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/bcftools-isec_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/bcftools-isec_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load bcftools

cd /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/
bcftools isec -p isec_output -Ov /global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/vcf-filtering/confused/populations.snps.filtered.vcf.gz /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-ALLchr-filteredsnps2.vcf.gz



