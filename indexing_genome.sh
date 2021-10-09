#To submit a job the following 2 lines need to be present:
#PBS -lselect=1:ncpus=8:mem=62gb  #number of nodes (1), cores (8) and memory (62gb)
#PBS -lwalltime=24:00:00 #the longer the walltime, the larger the number, the lower down the queue the job is

module load gcc/6.2.0 star/2.7.1a #load in module

STAR --runThreadN 8 \ #number of cores
-- runMode genomeGenerate \ #as opposed to alignReads for alignment
-- genomeDir $RDS_PROJECT/ins_rna_seq/live/genomes/indexed_genomes \ #location of genome files
-- genomeFastaFiles $RDS_PROJECT/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.fna \ #location of fna file
--sjdbGTFfile $RDS_PROJECT/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf \ #location of gtf file
--sjdbOverhang 99 \ #default value of readlength -1 (100-1)

