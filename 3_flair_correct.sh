#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem=150G
#SBATCH --partition=cpu-gen8
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=99:59:00
#SBATCH --output=flair_corr.out
#SBATCH --error=flair_corr.err

# path of input bed output from mapping step
input="RBB_rev.bed"

# genome fasta
genome_fasta="/home/exet4817/smarlow/genomes/mus_musculus/mm39.fa"
# gene GTF 
genome_gtf="/home/exet4817/smarlow/genomes/mus_musculus/gencode.vM35.annotation.gtf"
# annotation sJs
genome_sJS="/home/exet4817/smarlow/genomes/mus_musculus/gencode.vM35.annotation.gtf_SJs_sorted.tsv"

flair correct --query  "$input" \
--gtf "$genome_gtf"  \
--output $(basename "$input" .bam) --print_check \
-j "$genome_sJS" \
-t 8
