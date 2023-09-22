#!/bin/bash
#SBATCH --job-name=proradtag_P18
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=6:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/demux/P18/P18_demux_generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/demux/P18/P18_demux_generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#load any modules you'll need
module load stacks

process_radtags -P -1 /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/P18/P18_USPD16100802_H32VTCCX2_L7_1.fq.gz -2 /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/P18/P18_USPD16100802_H32VTCCX2_L7_2.fq.gz  -b /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/barcode_list-Copy-new.txt -q -e csp6I -o /global/scratch/laurenhamm/Data/rotations/Ben/demux/P18/

