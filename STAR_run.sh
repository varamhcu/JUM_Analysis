#1st pass mapping


STAR --runThreadN 3 --genomeDir genome_index_STAR_r1 --outFileNamePrefix ctrl_1 --readFilesIn ctrl_1_R01.fastq ctrl_1_R02.fastq --outSJfilterReads Unique

 
STAR --runThreadN 3/
--runMode genomeGenerate/
--genomeDir STAR_index_10.1_N/
--genomeFastaFiles GCF_000001735.4_TAIR10.1_genomic.fna/
--sjdbGTFfile GCF_000001735.4_TAIR10.1_genomic.gtf/
--sjdbOverhang 96
 --runMode genomeGenerate/
  --genomeDir STAR_index_10.1_N/
   --genomeFastaFiles GCF_000001735.4_TAIR10.1_genomic.fna/
    --sjdbGTFfile GCF_000001735.4_TAIR10.1_genomic.gtf/
     --sjdbOverhang 96 #s the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database

STAR --runThreadN 3 --genomeDir genome_index_STAR_r1 --outFileNamePrefix ctrl_1 --readFilesIn ctrl_1_R01.fastq ctrl_1_R02.fastq --outSJfilterReads Unique
#one pass runMode


STAR --runThreadN 8/
 --genomeDir STAR_index_10/ #the newly generated STAR index
  --outFileNamePrefix col_1/ #specifying the easiy identifyable name to the file for  future reference
   --readFilesIn SRR6333602.fastq/
    --outSJfilterReads Unique # considering uniquely mapping reads only for collapsing splice junction output


STAR --runThreadN 8/
 --genomeDir STAR_index_10/
  --outFileNamePrefix col_1/
   --readFilesIn SRR6333602.fastq/
    --outSJfilterReads Unique

STAR --runThreadN 8/
   --genomeDir STAR_index_10/
    --outFileNamePrefix col_1/
     --readFilesIn SRR6333602.fastq/
      --outSJfilterReads Unique