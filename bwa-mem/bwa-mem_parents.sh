#!/bin/bash
#SBATCH --job-name=bwa-mem-parents
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=400:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/bwa-mem-parents_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/bwa-mem-parents_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load bwa
module load samtools

cd /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/parental_data/
for d in Sample*; do cd "$d"; bwa mem -t 16 /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/ref-genome/Mguttatus_256_v2.0.fa *R1.fastq.gz *R2.fastq.gz | samtools view -b -S -o /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/$d\_aligned_sorted.bam; cd ..; done
