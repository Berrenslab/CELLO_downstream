# CELLO_downstream
This is the code to analyse CELLO-seq data post nextflow to obtain a count matrix. 

## Set-up 
To start please download this repository: 

```{ssh}
git clone https://github.com/Berrenslab/CELLO_downstream.git
```

We will use a conda environment to have all the required packages / versions. 

```{ssh}
conda activate 
conda env create -f environment.yaml
```

Now whenever you need to access this environment run:  **conda activate CELLO_downstream**

## Running flair 

To run the pipeline just edit each file with the inputs you need. Note that the references (fastas, gtf) specified here are for mm39. For anything else, just edit the inputs. Please follow each script by its number. 

1. Reverse complement and concatenate all reads into one big file
2. Align reads to genome
3. Correct novel isoforms
4. Collapse novel isoforms
5. Quantify expression

## Treansposable element filtering
