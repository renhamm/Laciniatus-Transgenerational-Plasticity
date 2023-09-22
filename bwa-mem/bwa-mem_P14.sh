#!/bin/bash
#SBATCH --job-name=bwa-mem-P14
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=400:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/P14/bwa-mem-P14_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/P14/bwa-mem-P14_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load bwa
module load samtools

cd /global/scratch/laurenhamm/Data/rotations/Ben/demux/P14/
for f in `ls -1 *.fq.gz | sed 's/.1.fq.gz//' | sed 's/.2.fq.gz//' | uniq`; do bwa mem -t 16 /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/ref-genome/Mguttatus_256_v2.0.fa $f\.1.fq.gz $f\.2.fq.gz | samtools view -b -S -o /global/scratch/laurenhamm/Data/rotations/Ben/alignments/P14/P14-$f\_aligned_sorted.bam; done
