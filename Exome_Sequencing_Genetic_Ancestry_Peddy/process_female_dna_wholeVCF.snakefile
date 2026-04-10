import os

configfile: "valleywise_pilot_config.dna.rdgroups.json"

gatk_path = "/home/splaisie/software/gatk-4.2.3.0/gatk"

rule all:
    input:
        expand("gvcfs/{sample}/{sample}.GRCh38.p12.genome.XXonly.g.vcf.gz", sample=config["female_samples"])

rule index_bam_female:
    input:
        "processed_bams/dna/{sample}.GRCh38.p12.genome.XXonly.mkdup.sorted.bam"
    output:
        "processed_bams/dna/{sample}.GRCh38.p12.genome.XXonly.mkdup.sorted.bam.bai"
    shell:
        "samtools index {input}"

rule gatk_gvcf:
    input:
        ref = "/data/CEM/shared/public_data/references/GENCODE/GRCh38.p12.genome.XXonly/GRCh38.p12.genome.XXonly.fa",
        bam = "processed_bams/dna/{sample}.GRCh38.p12.genome.XXonly.mkdup.sorted.bam",
        bai = "processed_bams/dna/{sample}.GRCh38.p12.genome.XXonly.mkdup.sorted.bam.bai"
    output:
        "gvcfs/{sample}/{sample}.GRCh38.p12.genome.XXonly.g.vcf.gz"
    params:
        gatk = gatk_path,
    threads:
        4
    shell:
        "{params.gatk} HaplotypeCaller -R {input.ref} -I {input.bam} --emit-ref-confidence GVCF --output {output}"
