#!/bin/bash
#SBATCH --job-name=parents-chr12
#SBATCH --account=fc_blackman
#SBATCH --partition=savio
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-chr12_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-chr12_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All


module load bcftools

bcftools mpileup -f /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/ref-genome/Mguttatus_256_v2.0.fa -r scaffold_12 /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Kim2726-49_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/OPN-6_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Per-6_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/RK46_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/RK48_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/TRT-4_aligned_SORTED_RG.bam | bcftools call -mv -Ov -o /global/scratch/laurenhamm/Data/rotations/Ben/bcftools-snp-calling/parents-chr12.vcf
