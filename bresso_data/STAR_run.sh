#The 2pass allignment

STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N --outFileNamePrefix STAR_alligned/col0_1 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333602.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N --outFileNamePrefix STAR_alligned/col0_2 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333604.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N --outFileNamePrefix STAR_alligned/col0_3 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333606.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N --outFileNamePrefix STAR_alligned/tcp23410_1 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333614.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N --outFileNamePrefix STAR_alligned/tcp23410_2 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333616.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N --outFileNamePrefix STAR_alligned/tcp23410_3 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333618.fastq.gz  --outSJfilterReads Unique


mkdir 1st_SJ
mv *SJ.out.tab 1st_SJ
mv *Log.final.out 1st_SJ
mv *Log.progress.out 1st_SJ
mv *Log.out 1st_SJ
rm *Aligned.out.sam

STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N  --outFileNamePrefix col0_1 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333602.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col0_1SJ.out.tab 1st_SJ/col0_2SJ.out.tab 1st_SJ/col0_3SJ.out.tab 1st_SJ/tcp23410_1SJ.out.tab 1st_SJ/tcp23410_2SJ.out.tab 1st_SJ/tcp23410_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N  --outFileNamePrefix col0_2 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333604.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col0_1SJ.out.tab 1st_SJ/col0_2SJ.out.tab 1st_SJ/col0_3SJ.out.tab 1st_SJ/tcp23410_1SJ.out.tab 1st_SJ/tcp23410_2SJ.out.tab 1st_SJ/tcp23410_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N  --outFileNamePrefix col0_3 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333606.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col0_1SJ.out.tab 1st_SJ/col0_2SJ.out.tab 1st_SJ/col0_3SJ.out.tab 1st_SJ/tcp23410_1SJ.out.tab 1st_SJ/tcp23410_2SJ.out.tab 1st_SJ/tcp23410_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N  --outFileNamePrefix tcp23410_1 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333614.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col0_1SJ.out.tab 1st_SJ/col0_2SJ.out.tab 1st_SJ/col0_3SJ.out.tab 1st_SJ/tcp23410_1SJ.out.tab 1st_SJ/tcp23410_2SJ.out.tab 1st_SJ/tcp23410_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N  --outFileNamePrefix tcp23410_2 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333616.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col0_1SJ.out.tab 1st_SJ/col0_2SJ.out.tab 1st_SJ/col0_3SJ.out.tab 1st_SJ/tcp23410_1SJ.out.tab 1st_SJ/tcp23410_2SJ.out.tab 1st_SJ/tcp23410_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index_TAIR10.1_N  --outFileNamePrefix tcp23410_3 --readFilesCommand zcat --readFilesIn raw_reads/SRR6333618.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col0_1SJ.out.tab 1st_SJ/col0_2SJ.out.tab 1st_SJ/col0_3SJ.out.tab 1st_SJ/tcp23410_1SJ.out.tab 1st_SJ/tcp23410_2SJ.out.tab 1st_SJ/tcp23410_3SJ.out.tab

#multi-mapping not allowed?

samtools view -bS col0_1Aligned.out.sam > col0_1Aligned.out.bam
samtools view -bS col0_2Aligned.out.sam > col0_2Aligned.out.bam
samtools view -bS col0_3Aligned.out.sam > col0_3Aligned.out.bam
samtools view -bS tcp23410_1Aligned.out.sam > tcp23410_1Aligned.out.bam
samtools view -bS tcp23410_2Aligned.out.sam > tcp23410_2Aligned.out.bam
samtools view -bS tcp23410_3Aligned.out.sam > tcp23410_3Aligned.out.bam


samtools sort -o col0_1Aligned.out_sorted.bam -T col0_1emp col0_1Aligned.out.bam
samtools sort -o col0_2Aligned.out_sorted.bam -T col0_2emp col0_2Aligned.out.bam
samtools sort -o col0_3Aligned.out_sorted.bam -T col0_3emp col0_3Aligned.out.bam
samtools sort -o tcp23410_1Aligned.out_sorted.bam -T tcp23410_1emp tcp23410_1Aligned.out.bam
samtools sort -o tcp23410_2Aligned.out_sorted.bam -T tcp23410_2emp tcp23410_2Aligned.out.bam
samtools sort -o tcp23410_3Aligned.out_sorted.bam -T tcp23410_3emp tcp23410_3Aligned.out.bam

samtools index col0_1Aligned.out_sorted.bam
samtools index col0_2Aligned.out_sorted.bam
samtools index col0_3Aligned.out_sorted.bam
samtools index tcp23410_1Aligned.out_sorted.bam
samtools index tcp23410_2Aligned.out_sorted.bam
samtools index tcp23410_3Aligned.out_sorted.bam

rm *Aligned.out.bam