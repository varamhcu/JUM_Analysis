mkdir raw_reads_fastqc

fastqc -t 8 raw_reads/*.fastq.gz -o raw_fastqc

cd raw_fastqc

multiqc .