#!/bin/bash
#SBATCH --partition=norm
#SBATCH --job-name="cnvkit"
#SBATCH --mail-user=seema.plaisier@nih.gov
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=70GB
#SBATCH --time=24:00:00
#SBATCH --output="slurm.%j.out"
#SBATCH --error="slurm.%j.err"

module load cnvkit/0.9.11

cd /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/cnvkit/

cnvkit.py batch /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/processed_bams_default/*sorted.bam -r pooled_reference.chr_only.cnn --output-dir cnvkit_results_2 --scatter --diagram --processes 20
