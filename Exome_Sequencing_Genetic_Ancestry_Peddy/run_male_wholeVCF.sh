#!/bin/bash
#SBATCH --job-name=maleWholeVCF # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH --mail-type=ALL               # notifications 
#SBATCH --mail-user=splaisie@asu.edu # send-to address
#SBATCH -n 2
#SBATCH --mem=32G
#SBATCH -p serial

cd /data/CEM/wilsonlab/projects/placenta/valleywise_pilot/
source activate SCCalign_v3
snakemake -s process_male_dna_wholeVCF.snakefile --rerun-incomplete -j 50 --cluster "sbatch -n 2 -p serial --mail-type=FAIL --mail-user=splaisie@asu.edu" --latency-wait=60
