#!/bin/bash

#If one command fails, the script stops instead of blindly continuing
set -e

# RNA-seq QC and preprocessing pipeline

# 1. FastQC on raw reads
fastqc data/raw/SRR031708.fastq.gz \
    --outdir results/fastqc

# 2. Quality filtering with fastp
fastp \
    -i data/raw/SRR031708.fastq.gz \
    -o data/processed/SRR031708_filtered.fastq.gz \
    -q 15 \
    -u 40 \
    -n 5 \
    -l 30 \
    --html results/fastp/SRR031708_fastp.html \
    --json results/fastp/SRR031708_fastp.json

# 3. 3'-end quality trimming
fastp \
    -i data/processed/SRR031708_filtered.fastq.gz \
    -o data/processed/SRR031708_trimmed.fastq.gz \
    --cut_tail \
    --cut_tail_window_size 4 \
    --cut_tail_mean_quality 15 \
    --length_required 30 \
    --html results/fastp/SRR031708_fastp_trimmed.html \
    --json results/fastp/SRR031708_fastp_trimmed.json

# 4. FastQC on final reads
fastqc data/processed/SRR031708_trimmed.fastq.gz \
    --outdir results/fastqc

# 5. Summarize QC results
multiqc results/fastqc \
    -o results/multiqc
