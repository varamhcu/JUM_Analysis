#STAR Indexing

cd bresso_data

#indexing from TAIR10.1 with new --sjdboverhang value
mkdir STAR_index_10.1_N

STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeSAindexNbases 12 \
--genomeDir STAR_index_10.1_N \ 
--genomeFastaFiles reference_files/GCF_000001735.4_TAIR10.1_genomic.fna \
--sjdbGTFfile reference_files/GCF_000001735.4_TAIR10.1_genomic.gtf \
--sjdbOverhang 96

# the above alue is the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. Ideally, this length should be equal to the lenght of the read-1.

#As genePred file formation was failed with TAIR10.1 ; A new indexing with TAIR10.27 (?)

mkdir STAR_index_10.27

STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir STAR_index_10.27 \ 
--genomeFastaFiles reference_files/TAIR10.27/TAIR10.27.dna.toplevel.fa \
--sjdbGTFfile reference_files/TAIR10.27/TAIR10.27.gtf \ 
--sjdbOverhang 96