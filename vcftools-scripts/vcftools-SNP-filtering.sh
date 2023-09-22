#!/bin/bash
#SBATCH --job-name=vcftools-filter
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=5:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/vcf-filtering/vcftools-SNP-filtering_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/vcf-filtering/vcftools-SNP-filtering_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load bio/vcftools

vcftools --vcf /global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/populations.snps.vcf --missing-indv --missing-site --out /global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/vcf-filtering/
