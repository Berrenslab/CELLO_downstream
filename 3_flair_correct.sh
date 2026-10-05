#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem=150G
#SBATCH --partition=cpu-gen8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=99:59:00
#SBATCH --output=flair_corr.out
#SBATCH --error=flair_corr.err

# actvate environment 
conda activate CELLO_downstream

# path of input bam output from mapping step
input="RBB_rev.bam"

# convert bam to bed output 
bam2Bed12 -i "$input" > "$(basename "$input" .bam).bed"
# genome fasta
genome_fasta="/home/exet4817/smarlow/genomes/mus_musculus/mm39.fa"
# geme gtf 
genome_gtf="/home/exet4817/smarlow/genomes/mus_musculus/gencode.vM35.annotation.gtf"
#annatation sJs
genome_sJS="/home/exet4817/smarlow/genomes/mus_musculus/gencode.vM35.annotation.gtf_SJs_sorted.tsv"

flair correct -g "$genome_fasta"  \
--query RBB_rev.bed  \
--gtf "$genome_gtf"  \
--output $(basename "$input" .bam) --print_check \
-j "$genome_sJS" \
-t 8
