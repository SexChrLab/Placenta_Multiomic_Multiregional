#!/bin/bash
#SBATCH --partition=norm
#SBATCH --job-name="cnvkit"
#SBATCH --mail-user=seema.plaisier@nih.gov
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=50GB
#SBATCH --time=24:00:00
#SBATCH --output="slurm.%j.out"
#SBATCH --error="slurm.%j.err"

module load cnvkit/0.9.11

cd /data/Wilson_Lab/projects/placenta_multiomics/valleywise_pilot/cnvkit/

awk '$1 ~ /^chr([1-9]$|1[0-9]$|2[0-2]$|X$|Y$)/' sample.cnr > sample.clean.cnr
awk '$1 ~ /^chr([1-9]$|1[0-9]$|2[0-2]$|X$|Y$)/' sample.cns > sample.clean.cns

for chr in chr1 chr2 chr3 chrX chrY; do
  cnvkit.py scatter sample.cnr -s sample.cns -c $chr \
    -o sample_${chr}.pdf
done
