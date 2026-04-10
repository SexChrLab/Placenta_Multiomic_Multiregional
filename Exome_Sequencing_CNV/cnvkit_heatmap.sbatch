#!/bin/bash
#SBATCH --partition=norm
#SBATCH --job-name="cnv_heatmap"
#SBATCH --mail-user=seema.plaisier@nih.gov
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=50GB
#SBATCH --time=2:00:00
#SBATCH --output="slurm.%j.out"
#SBATCH --error="slurm.%j.err"

module load cnvkit/0.9.11

cd /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/cnvkit/

cnvkit.py heatmap /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/cnvkit/cnvkit_results_2/*.targetcoverage.cnn -o cnvkit_results_2/cohort_heatmap.pdf
