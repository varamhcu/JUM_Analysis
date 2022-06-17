mkdir trimmed_reads_fastqc

fastqc -t 8 trimmed_raw_reads/*.fastq.gz -o trimmed_raw_reads_fastqc

cd trimmed_raw_reads_fastqc

multiqc .