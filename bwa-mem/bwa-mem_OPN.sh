#!/bin/bash
#SBATCH --job-name=bwa-mem-OPN
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=400:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/bwa-mem-OPN_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/bwa-mem-OPN_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load bwa
module load samtools

cd /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/parental_data/Sample_OPN-6

bwa mem -t 16 /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/ref-genome/Mguttatus_256_v2.0.fa OPN-6-R1.fastq.gz OPN-6-R2.fastq.gz | samtools view -b -S -o /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/OPN-6_aligned_sorted.bam
