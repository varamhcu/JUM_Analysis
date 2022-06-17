#make sure you have all the raw reads in ../raw_reads

mkdir bresso_data/trimmed_raw_reads

cat SRR_Acc_List.txt | parallel -j 4 "fastp -i raw_reads/{}.fastq.gz -o trimmed_raw_reads/{}.fastq.gz"