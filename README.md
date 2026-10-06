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
conda env create -f CELLO_downstream/environment.yaml
```
* the path may change, you just need to find the file _environment.yaml_, which will be inside _CELLO_downstream_. 

Now whenever you need to access this environment run:  **conda activate CELLO_downstream**

## Running flair 

To run the pipeline just edit each file with the inputs you need. Note that the references (fastas, gtf) specified here are for mm39. For anything else, just edit the inputs. Please follow each script by its number. The files are in the _CELLO_downstream_ folder. 

1. Reverse complement and concatenate all reads into one big file
2. Align reads to genome
3. Correct novel isoforms
4. Collapse novel isoforms
5. Quantify expression
  - this will need an manifest file, see manifest_example.tsv

### Manifest file 
The manifest file is needed in the quantify step to specify which reads come from which cell. The general structure is

cell _tab_ sample _tab_ batch _tab_ path/to/cell/fastq

* See example_manifest.tsv for an example
* You cannot have _ in the names
* the file needs to be _ tab_-delimited. You can check this by running:
```{ssh}
bash cat -A example_manifest.tsv
```
The spaces across columns should appear as ^I . 

**For more information see the FLAIR documentation:** https://flair.readthedocs.io/en/latest/modules.html

## Transposable element filtering
