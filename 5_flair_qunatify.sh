#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem=350G
#SBATCH --partition=cpu-gen12
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=07-00:00:00
#SBATCH --output=flair_quant.out
#SBATCH --error=flair_quant.err

# actvate environment 
conda activate CELLO_downstream

#tsv manifest file of cell-specific files
manifest_tsv='input_fullpath.tsv'
# collapse isoform fasta
collapse_isoforms_fasta='collapse.isoforms.fa'
# isoform bed 
collapse_isoforms_bed='collapse.isoforms.bed'

flair quantify -r "$manifest_tsv"  -i $"collapse_isoforms_fasta" \
--output out_ \
--temp_dir ~ \
--isoform_bed "$collapse_isoforms_bed" \
--check_splice \
-t 12
