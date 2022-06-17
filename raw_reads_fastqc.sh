mkdir raw_reads_fastqc

fastqc -t 8 raw_reads/*.fastq.gz -o raw_reads_fastqc

cd raw_reads_fastqc

multiqc .