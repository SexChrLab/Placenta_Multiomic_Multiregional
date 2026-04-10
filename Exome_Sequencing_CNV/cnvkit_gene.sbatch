#!/bin/bash
#SBATCH --partition=norm
#SBATCH --job-name="cnv_gene"
#SBATCH --mail-user=seema.plaisier@nih.gov
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=70GB
#SBATCH --time=24:00:00
#SBATCH --output="slurm.%j.out"
#SBATCH --error="slurm.%j.err"

module load cnvkit/0.9.11

cd /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/cnvkit/

for cnr in cnvkit_results_2/*.cnr; do
  base=$(basename "$cnr" .cnr)

  cnvkit.py genemetrics "$cnr" -s "cnvkit_results_2/${base}.cns" -o "cnvkit_results_2/${base}.genemetrics.tsv"

  cnvkit.py breaks "$cnr" "cnvkit_results_2/${base}.cns" -o "cnvkit_results_2/${base}.breaks.tsv"

done
