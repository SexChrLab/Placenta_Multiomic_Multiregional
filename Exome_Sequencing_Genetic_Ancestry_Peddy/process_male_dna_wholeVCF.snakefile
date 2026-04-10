# ------
# README:
# before running this snakemake file, please edit line 15 to give the correct path to GATK.
# before running this snakemake file, please edit line 837 to give the correct path to the python script
# The script calc_num_site_in_vcf.py can be found at https://github.com/tanyaphung/vcfhelper
# ------
import os

configfile: "valleywise_pilot_config.dna.rdgroups.json"

gatk_path = "/home/splaisie/software/gatk-4.2.3.0/gatk"

rule all:
    input:
        expand("gvcfs/{sample}/{sample}.GRCh38.p12.genome.XY.g.vcf.gz", sample=config["male_samples"])

rule index_bam_male:
    input:
        "processed_bams/dna/{sample}.GRCh38.p12.genome.XY.mkdup.sorted.bam"
    output:
        "processed_bams/dna/{sample}.GRCh38.p12.genome.XY.mkdup.sorted.bam.bai"
    shell:
        "samtools index {input}"

rule gatk_gvcf:
    input:
        ref = "/data/CEM/shared/public_data/references/GENCODE/GRCh38.p12.genome.XY/GRCh38.p12.genome.XY.fa",
        bam = "processed_bams/dna/{sample}.GRCh38.p12.genome.XY.mkdup.sorted.bam",
        bai = "processed_bams/dna/{sample}.GRCh38.p12.genome.XY.mkdup.sorted.bam.bai"
    output:
        "gvcfs/{sample}/{sample}.GRCh38.p12.genome.XY.g.vcf.gz"
    params:
        gatk = gatk_path,
    threads:
        4
    shell:
        "{params.gatk} HaplotypeCaller -R {input.ref} -I {input.bam} --emit-ref-confidence GVCF --output {output}"
