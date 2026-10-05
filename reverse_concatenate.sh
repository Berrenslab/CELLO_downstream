#!/bin/bash
#SBATCH --job-name=rev
#SBATCH --nodes=1
#SBATCH --partition=cpu-gen4
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=100gb
#SBATCH --time=55:00:00

# actvate environment 
conda activate CELLO_downstream

# path of input corrected fastq reads
input="/home/grte3662/RBB/data"

# create output dir
output="rev_data"
mkdir -p "$output"

# this code will take all files ending in *fastq in input folder and reverse complement them and output them in an output directory. 

for file in "$input"/*fastq; do
    base=$(basename "$file")
    echo "Processing $base..."
    seqtk seq -r "$file" > "$output/$base"
done

# now concatenate all files into one

cat rev_data/* > RBB_rev.fastq
