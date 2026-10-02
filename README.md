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
