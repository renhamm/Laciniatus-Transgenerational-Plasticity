#!/bin/bash
#SBATCH --job-name=Picard31x
#SBATCH --verbose
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --mem-per-cpu=32G
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/gatk-files/YOUR_ERR_FILEx.err
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/gatk-files/YOUR_STD_OUTFILEx.out
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All
#SBATCH --array=0-5

#load any modules you'll need
module load picard 

INPUT=(/global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Sample_Kim2726-49_aligned_SORTED.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Sample_OPN-6_aligned_SORTED.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Sample_Per-6_aligned_SORTED.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Sample_RK46_aligned_SORTED.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Sample_RK48_aligned_SORTED.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Sample_TRT-4_aligned_SORTED.bam)
OUTPUT=(/global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Kim2726-49_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/OPN-6_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Per-6_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/RK46_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/RK48_aligned_SORTED_RG.bam /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/TRT-4_aligned_SORTED_RG.bam)

RGSM=(HHR-12 OPN-6 PET-6 SNB-15 SHL-17 TRT-14)


java -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/picard/2.9.0/lib/picard.jar AddOrReplaceReadGroups \
INPUT=${INPUT[$SLURM_ARRAY_TASK_ID]} \
OUTPUT=${OUTPUT[$SLURM_ARRAY_TASK_ID]} \
RGID=H0164.1 \
RGLB=lib1 \
RGPL=illumina \
RGPU=H0164ALXX140820.1 \
RGSM=${RGSM[$SLURM_ARRAY_TASK_ID]} \
SORT_ORDER=coordinate \
CREATE_INDEX=true

