#STAR Indexing

cd bresso_data
#indexing from TAIR10.1 from new source


STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir STAR_index_10.1_N \
--genomeFastaFiles GCF_000001735.4_TAIR10.1_genomic.fna \
--sjdbGTFfile GCF_000001735.4_TAIR10.1_genomic.gtf \
--sjdbOverhang 96

