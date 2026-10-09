#!/bin/bash
#SBATCH --job-name=mapping_wn
#SBATCH --nodes=1
#SBATCH --partition=himem-gen24
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=1000gb
#SBATCH --time=90:00:00
#SBATCH --output=mapping_wn.out
#SBATCH --error=mapping_wn.err

# activate environment 
source ~/.bashrc
conda init
conda activate CELLO_downstream

# genome-specific kmer file
kmer_file="/home/grte3662/references/mm39/genome/repetitive_k15_mm39.txt"
# genome fasta
genome_fasta="/home/exet4817/smarlow/genomes/mus_musculus/mm39.fa"
# input, concatenated reverse complement file 
input="/home/grte3662/RBB/RBB_rev.fastq"
#output file 
output="/home/grte3662/RBB/RBB_rev.bam"

# map 
winnowmap \
    -W "$kmer_file" \
    -ax splice \
    -t 20 \
    "$genome_fasta" \
    "$input" \
    | samtools sort -@ 12 -o "$output"

# index output bam file 
samtools index "$output"

# convert sam to bed 
module load FLAIR
