#!/bin/bash
#SBATCH --partition=norm
#SBATCH --job-name="cnvkit"
#SBATCH --mail-user=seema.plaisier@nih.gov
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=50GB
#SBATCH --time=2:00:00
#SBATCH --output="slurm.%j.out"
#SBATCH --error="slurm.%j.err"

module load cnvkit/0.9.11

cd /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/cnvkit/

cnvkit.py access /data/Wilson_Lab/references/GENCODE/GRCh38.p12.genome/GRCh38.p12.genome.fa -o access.GRCh38.p12.bed
