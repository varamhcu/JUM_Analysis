mkdir bresso_data/trimmed_raw_reads

cat SRR_Acc_List.txt | parallel -j 4 "fastp -i raw_reads/{}.fq.gz -o trimmed_raw_reads/{}.fq.gz"