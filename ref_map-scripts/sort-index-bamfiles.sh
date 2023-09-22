#!/bin/bash
#SBATCH --job-name=sort-index-bam
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/sorted-files/sort-ALL_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/sorted-files/sort-ALL_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load samtools

cd /global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/

for f in *.bam; do samtools sort "$f" > /global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/sorted-files/"$f"; done

cd /global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/sorted-files/

for f in *.bam; do samtools index "$f"; done



