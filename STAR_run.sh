#cat Acc_list.txt | parallel -j 1 "STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/{} --readFilesCommand zcat --readFilesIn trimmed_raw_reads/{}.fastq.gz --outSJfilterReads Unique"

#The 2pass allignment

STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/col_1 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723215_1_T.fastq.gz trimmed_raw_reads/SRR14723215_2_T.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/col_2 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723218_1_T.fastq.gz trimmed_raw_reads/SRR14723218_2_T.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/col_3 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723219_1_T.fastq.gz trimmed_raw_reads/SRR14723219_2_T.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/dex_1 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723208_1_T.fastq.gz trimmed_raw_reads/SRR14723208_2_T.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/dex_2 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723216_1_T.fastq.gz trimmed_raw_reads/SRR14723216_2_T.fastq.gz --outSJfilterReads Unique
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1 --outFileNamePrefix STAR_alligned/dex_3 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723217_1_T.fastq.gz trimmed_raw_reads/SRR14723217_2_T.fastq.gz --outSJfilterReads Unique


mkdir 1st_SJ
mv *SJ.out.tab 1st_SJ
mv *Log.final.out 1st_SJ
mv *Log.progress.out 1st_SJ
mv *Log.out 1st_SJ
rm *Aligned.out.sam

STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1  --outFileNamePrefix col_1 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723215_1_T.fastq.gz trimmed_raw_reads/SRR14723215_2_T.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col_1SJ.out.tab 1st_SJ/col_2SJ.out.tab 1st_SJ/col_3SJ.out.tab 1st_SJ/dex_1SJ.out.tab 1st_SJ/dex_2SJ.out.tab 1st_SJ/dex_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1  --outFileNamePrefix col_2 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723218_1_T.fastq.gz trimmed_raw_reads/SRR14723218_2_T.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col_1SJ.out.tab 1st_SJ/col_2SJ.out.tab 1st_SJ/col_3SJ.out.tab 1st_SJ/dex_1SJ.out.tab 1st_SJ/dex_2SJ.out.tab 1st_SJ/dex_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1  --outFileNamePrefix col_3 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723219_1_T.fastq.gz trimmed_raw_reads/SRR14723219_2_T.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col_1SJ.out.tab 1st_SJ/col_2SJ.out.tab 1st_SJ/col_3SJ.out.tab 1st_SJ/dex_1SJ.out.tab 1st_SJ/dex_2SJ.out.tab 1st_SJ/dex_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1  --outFileNamePrefix dex_1 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723208_1_T.fastq.gz trimmed_raw_reads/SRR14723208_2_T.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col_1SJ.out.tab 1st_SJ/col_2SJ.out.tab 1st_SJ/col_3SJ.out.tab 1st_SJ/dex_1SJ.out.tab 1st_SJ/dex_2SJ.out.tab 1st_SJ/dex_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1  --outFileNamePrefix dex_2 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723216_1_T.fastq.gz trimmed_raw_reads/SRR14723216_2_T.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col_1SJ.out.tab 1st_SJ/col_2SJ.out.tab 1st_SJ/col_3SJ.out.tab 1st_SJ/dex_1SJ.out.tab 1st_SJ/dex_2SJ.out.tab 1st_SJ/dex_3SJ.out.tab
STAR --runThreadN 8 --genomeDir STAR_Index/TAIR10.1  --outFileNamePrefix dex_3 --readFilesCommand zcat --readFilesIn trimmed_raw_reads/SRR14723217_1_T.fastq.gz trimmed_raw_reads/SRR14723217_2_T.fastq.gz --outSJfilterReads Unique --outSAMstrandField intronMotif --outFilterMultimapNmax 1 -sjdbFileChrStartEnd 1st_SJ/col_1SJ.out.tab 1st_SJ/col_2SJ.out.tab 1st_SJ/col_3SJ.out.tab 1st_SJ/dex_1SJ.out.tab 1st_SJ/dex_2SJ.out.tab 1st_SJ/dex_3SJ.out.tab

#multi-mapping not allowed?




samtools view -bS col_1Aligned.out.sam > col_1Aligned.out.bam
samtools view -bS col_2Aligned.out.sam > col_2Aligned.out.bam
samtools view -bS col_3Aligned.out.sam > col_3Aligned.out.bam
samtools view -bS dex_1Aligned.out.sam > dex_1Aligned.out.bam
samtools view -bS dex_2Aligned.out.sam > dex_2Aligned.out.bam
samtools view -bS dex_3Aligned.out.sam > dex_3Aligned.out.bam


samtools sort -o col_1Aligned.out_sorted.bam -T col_1_temp col_1Aligned.out.bam
samtools sort -o col_2Aligned.out_sorted.bam -T col_2_temp col_2Aligned.out.bam
samtools sort -o col_3Aligned.out_sorted.bam -T col_3_temp col_3Aligned.out.bam
samtools sort -o dex_1Aligned.out_sorted.bam -T dex_1_temp dex_1Aligned.out.bam
samtools sort -o dex_2Aligned.out_sorted.bam -T dex_2_temp dex_2Aligned.out.bam
samtools sort -o dex_3Aligned.out_sorted.bam -T dex_3_temp dex_3Aligned.out.bam

samtools index col_1Aligned.out_sorted.bam
samtools index col_2Aligned.out_sorted.bam
samtools index col_3Aligned.out_sorted.bam
samtools index dex_1Aligned.out_sorted.bam
samtools index dex_2Aligned.out_sorted.bam
samtools index dex_3Aligned.out_sorted.bam

rm *Aligned.out.bam