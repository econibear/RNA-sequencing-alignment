#PBS -lselect=1:ncpus=8:mem=62gb
#PBS -lwalltime=24:00:00

module load gcc/6.2.0 star/2.7.1a

STAR --runThreadN 8 \
-- runMode genomeGenerate \
-- genomeDir $RDS_PROJECT/ins_rna_seq/live/genomes/indexed_genomes \
-- genomeFastaFiles $RDS_PROJECT/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.fna \
--sjdbGTFfile $RDS_PROJECT/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf \
--sjdbOverhang 99 \

