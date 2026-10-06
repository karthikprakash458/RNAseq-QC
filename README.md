# RNA-seq Quality Control and Preprocessing

## Overview

This project demonstrates a basic RNA-seq quality control and preprocessing workflow.

The workflow uses FastQC to assess raw sequencing quality, fastp to remove low-quality reads and trim low-quality 3′ ends, and MultiQC to summarize the QC results.

## Workflow

Raw FASTQ
→ FastQC
→ Quality filtering with fastp
→ 3′-end quality trimming
→ FastQC
→ MultiQC

## Dataset

- Sample: SRR031708
- Organism: Drosophila melanogaster
- Read type: Single-end
- Original read length: 45 bp
- Original reads: 5,836,296

## Tools

- FastQC
- fastp
- MultiQC
- Linux/Bash

## Quality Control

Initial FastQC analysis showed:

- Poor quality toward the 3′ end of reads
- Many reads with average quality around Q20
- Some increase in N content toward the 3′ end
- Read length was consistently 45 bp

## Preprocessing

fastp was used in two stages.

### Quality filtering

Reads were filtered using:

- Minimum base quality: Q15
- Maximum percentage of low-quality bases: 40%
- Maximum N bases: 5
- Minimum read length: 30 bp

After filtering:

- Input reads: 5,836,296
- Reads retained: 5,416,357

### 3′-end trimming

Low-quality 3′ ends were trimmed using:

- Sliding window: 4 bp
- Mean quality threshold: Q15
- Minimum read length: 30 bp

After trimming:

- Reads retained: 4,502,590
- Q20 bases: 87.0%

## Final QC

FastQC was run again after preprocessing.

The final reads showed substantially improved quality across most of the read length, although quality decreased at the final few bases.

N content was effectively eliminated.

## MultiQC

MultiQC was used to combine the QC results into a single report.

Final statistics:

- Reads: ~4.5 million
- GC content: 51%
- Duplication: 19%

## Conclusion

The RNA-seq dataset initially showed substantial 3′-end quality degradation.

Quality filtering removed poor-quality reads, followed by gentle 3′-end trimming. The final dataset retained approximately 4.5 million reads and showed improved overall base quality.

The processed dataset provides a suitable starting point for downstream RNA-seq analysis.
