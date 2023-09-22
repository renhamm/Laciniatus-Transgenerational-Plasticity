#!/bin/bash
#SBATCH --job-name=ref_map.pl-ALL
#SBATCH --account=fc_blackman
#SBATCH --partition=savio_bigmem
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/ref_map-ALL_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/ref_map-ALL_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load stacks

ref_map.pl --samples /global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/sorted-files/ --popmap /global/scratch/laurenhamm/Data/rotations/Ben/alignments/ALL/LIST2forpopmap.txt -o /global/scratch/laurenhamm/Data/rotations/Ben/ref_map-files/ -X "populations:-e csp6I" -X "populations:--fstats" -X "populations:--vcf" -X "populations:--hwe" -X "populations:--min-samples-overall 0.1" -X "populations:--min-maf 0.05" -T 20
