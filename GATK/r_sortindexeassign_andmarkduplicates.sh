#Sort index and assign read groups
#!/bin/bash
#SBATCH --job-name=Picard31x
#SBATCH --workdir=/global/scratch/jmcbulls/IMSWC
#SBACTH --verbose
#SBATCH --account=co_rosalind
#SBATCH --partition=savio
#SBATCH --qos=rosalind_savio_normal
#SBATCH --mem-per-cpu=32G
#SBATCH --time=24:00:00
#SBATCH --error=YOUR_ERR_FILEx.err
#SBATCH --output=YOUR_STD_OUTFILEx.out
#SBATCH --mail-user=colicchio@berkeley.edu
#SBATCH --mail-type=All
#SBATCH --array=0-7


#load any modules you'll need
module load picard/2.4.1 

INPUT=(bcis51.bam bcis52.bam bcis53.bam bcis54.bam bcis55.bam bcis56.bam bcis57.bam bcis58.bam)
OUTPUT=(sbcis51.rg.bam sbcis52.rg.bam sbcis53.rg.bam sbcis54.rg.bam sbcis55.rg.bam sbcis56.rg.bam sbcis57.rg.bam sbcis58.rg.bam)
RGSM=(IM51 IM52 IM53 IM54 IM55 IM56 IM57 IM58)


java -Xmx100G -jar /clusterfs/vector/home/groups/software/sl-6.x86_64/modules/picard/2.4.1/picard.jar AddOrReplaceReadGroups \
INPUT=${INPUT[$SLURM_ARRAY_TASK_ID]} \
OUTPUT=${OUTPUT[$SLURM_ARRAY_TASK_ID]} \
RGID=H0164.1 \
RGLB=lib1 \
RGPL=illumina \
RGPU=H0164ALXX140820.1 \
RGSM=${RGSM[$SLURM_ARRAY_TASK_ID]} \
SORT_ORDER=coordinate \
CREATE_INDEX=true

#Mark Duplicates

#!/bin/bash
#SBATCH --job-name=Picard31x
#SBATCH --workdir=/global/scratch/jmcbulls/IMSWC
#SBACTH --verbose
#SBATCH --account=co_rosalind
#SBATCH --partition=savio2_htc
#SBATCH --qos=rosalind_htc2_normal
#SBATCH --mem-per-cpu=110G
#SBATCH --time=24:00:00
#SBATCH --error=YOUR_ERR_FILEx.err
#SBATCH --output=YOUR_STD_OUTFILEx.out
#SBATCH --mail-user=colicchio@berkeley.edu
#SBATCH --mail-type=All
#SBATCH --array=0-3


#load any modules you'll need
module load picard/2.4.1 


INPUT=(bcis42.rg.bam sbcis43.rg.bam sbcis44.rg.bam sbcis45.rg.bam)
OUTPUT=(sbcis42.mdup.rg.bam sbcis43.mdup.rg.bam sbcis44.mdup.rg.bam sbcis45.mdup.rg.bam)
METRICS=(42.metrics 43.metrics 44.metrics 45.metrics)

java -Xmx100G -jar /clusterfs/vector/home/groups/software/sl-6.x86_64/modules/picard/2.4.1/picard.jar MarkDuplicates \
INPUT=${INPUT[$SLURM_ARRAY_TASK_ID]} \
OUTPUT=${OUTPUT[$SLURM_ARRAY_TASK_ID]} \
METRICS_FILE=${METRICS[$SLURM_ARRAY_TASK_ID]} \
CREATE_INDEX=true