#!/bin/bash
#SBATCH --job-name=gatk-filter
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=5:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/snpsonly_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/snpsonly_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

module load gatk/3.8.0 

java -Xmx108G -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/gatk/3.8.0/GenomeAnalysisTK.jar \
    -T SelectVariants \
    -R /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/ref-genome/Mguttatus_256_v2.0.fa \
    -V /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-ALLchr.vcf \
    -selectType SNP \
    -o /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-ALLchr-snps.vcf 
