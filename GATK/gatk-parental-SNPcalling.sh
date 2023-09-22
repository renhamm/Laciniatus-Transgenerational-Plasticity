#!/bin/bash
#SBATCH --job-name=gatk-parents
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=400:00:00
#SBATCH --error=/global/scratch/laurenhamm/Data/rotations/Ben/gatk-files/parents-generated-error.txt
#SBATCH --output=/global/scratch/laurenhamm/Data/rotations/Ben/gatk-files/parents-generated-error.txt
#SBATCH --mail-user=laurenhamm@berkeley.edu
#SBATCH --mail-type=All

#ad any modules you'll need
module load gatk/3.8.0 

java -Xmx112G -jar /clusterfs/vector/home/groups/software/sl-7.x86_64/modules/gatk/3.8.0/GenomeAnalysisTK.jar \
-R /global/scratch/laurenhamm/Data/rotations/Ben/Mimulus/ref-genome/Mguttatus_256_v2.0.fa \
-T HaplotypeCaller \
-I /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Kim2726-49_aligned_SORTED_RG.bam \ -I /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/OPN-6_aligned_SORTED_RG.bam \ -I /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/Per-6_aligned_SORTED_RG.bam \ -I /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/RK46_aligned_SORTED_RG.bam \ -I /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/RK48_aligned_SORTED_RG.bam \ -I /global/scratch/laurenhamm/Data/rotations/Ben/alignments/parents/TRT-4_aligned_SORTED_RG.bam \
-ploidy 2 \
-o /global/scratch/laurenhamm/Data/rotations/Ben/gatk-files/parentsMim.vcf \
--min_base_quality_score 25 \
-maxAltAlleles 1 \
-mmq 24 \
--heterozygosity 0.001
