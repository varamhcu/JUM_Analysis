#STAR Indexing

cd bresso_data

#indexing from TAIR10.1 from new source

STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir STAR_index_10.1_N \ # to run genome indices generation job
--genomeFastaFiles reference_files/GCF_000001735.4_TAIR10.1_genomic.fna \ #the path to genome reference file
--sjdbGTFfile reference_files/GCF_000001735.4_TAIR10.1_genomic.gtf \ #the path to annotation file
--sjdbOverhang 96 # the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. Ideally, this length should be equal to the lenght of the read-1.

#As genePred file formation was failed with TAIR10.1 ; A new indexing with TAIR10.27 (?)

STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir STAR_index_10.27 \ # to run genome indices generation job
--genomeFastaFiles reference_files/TAIR10.27/TAIR10.27.dna.toplevel.fa \ #the path to genome reference file
--sjdbGTFfile reference_files/TAIR10.27/TAIR10.27.gtf \ #the path to annotation file
--sjdbOverhang 96 # the length of the genomic sequence around the annotated junction to be used in constructing the splice junctions database. Ideally, this length should be equal to the lenght of the read-1.
