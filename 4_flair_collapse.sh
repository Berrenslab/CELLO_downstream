#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem=350G
#SBATCH --partition=cpu-gen12
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=99:59:00
#SBATCH --output=flair_coll.out
#SBATCH --error=flair_coll.err

# actvate environment 
conda activate CELLO_downstream

#input reads
input_reads="RBB_rev.fastq"
# input all corrected bed
input_all_corrected_bed="RBB_all_corrected.bed"
# genome fasta
genome_fasta="/home/exet4817/smarlow/genomes/mus_musculus/mm39.fa"
# geme gtf 
genome_gtf="/home/exet4817/smarlow/genomes/mus_musculus/gencode.vM35.annotation.gtf"
#annatation sJs
genome_sJS="/home/exet4817/smarlow/genomes/mus_musculus/gencode.vM35.annotation.gtf_SJs_sorted.tsv"


flair collapse --reads "$input_reads"  --query "$input_all_corrected_bed" \
--gtf "$genome_gtf" \
--genome "$genome_fasta" \
--output collapse \
-t 10 \
--temp_dir ~

#temp_dir needs to be your own otherwise genoa node will crash. ~ means your home. 

