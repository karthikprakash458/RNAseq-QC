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

## Results and Interpretation

### Raw Read QC

Initial FastQC analysis of SRR031708 showed substantial quality deterioration toward the 3′ end of the 45 bp reads.

Key observations:

- 5,836,296 raw reads were analyzed.
- Approximately 60.5% of bases had a quality score of Q20 or higher.
- Per-base sequence quality decreased substantially after approximately 30 bp.
- N content increased slightly toward the 3′ end.
- Read length was uniform at 45 bp.
- No overrepresented sequences were detected.

These results indicated that quality preprocessing was required before downstream analysis.

### Effect of Quality Filtering

Initial fastp filtering retained:

- Input reads: 5,836,296
- Reads retained: 5,416,357
- Reads removed due to low quality: 375,693
- Reads removed due to excessive N bases: 44,246

Approximately 92.8% of the original reads were retained.

### Effect of 3′-End Trimming

Gentle 3′-end trimming was then performed using a sliding window approach.

After trimming:

- Reads retained: 4,502,590
- Reads retained relative to filtered input: ~83.1%
- Q20 base proportion increased from 61.6% to 87.0%.
- N content was effectively eliminated.

The final FastQC analysis showed substantially improved sequence quality across most of the read length. Quality still decreased at the final few bases, but the overall dataset was considerably improved without excessive loss of reads.

### Overall Interpretation

The main quality issue in the raw dataset was poor 3′-end sequence quality. Quality filtering removed low-quality reads and reads containing excessive ambiguous bases, while subsequent 3′-end trimming improved the quality of the remaining bases.

The preprocessing reduced the dataset from approximately 5.84 million raw reads to 4.50 million final reads while substantially improving the proportion of Q20 bases.

The final dataset provides a suitable starting point for downstream RNA-seq analysis.

## Conclusion

The RNA-seq dataset initially showed substantial 3′-end quality degradation.

Quality filtering removed poor-quality reads, followed by gentle 3′-end trimming. The final dataset retained approximately 4.5 million reads and showed improved overall base quality.

The processed dataset provides a suitable starting point for downstream RNA-seq analysis.
