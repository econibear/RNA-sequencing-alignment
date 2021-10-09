#To submit a job the following 2 lines need to be present:
#PBS -lselect=1:ncpus=8:mem=64gb  #number of nodes (1), cores (8) and memory (64gb)
#PBS -lwalltime=72:00:00 #the longer the walltime, the larger the number, the lower down the queue the job is

cd $RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/trim_output #go to this location on the HPC

module load gcc/6.2.0 star/2.7.1a #load up STAR align

for prefix in $(ls *.fq.gz | sed -r 's/_R[12]_001_merged_val_[12].fq.gz//' | uniq) #find the unique prefixes of samples to then align them
do
STAR \ #initiate STAR
--runThreadN 8 \ #number of cores
--outFileNamePrefix $RDS_PROJECT/ins_rna_seq/live/STAR_output/${prefix} \ #location of all output files
--outSAMattributes NH HI AS NM MD \
--runMode alignReads \ #as opposed to genomeGenerate for indexing a genome
--quantMode TranscriptomeSAM GeneCounts \ #choose the outputs for the files
--sjdbGTFfile $RDS_PROJECT/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf \ #location of the genome file
--genomeLoad NoSharedMemory \
--outSAMunmapped Within \
--outSAMtype BAM SortedByCoordinate \ #type of output file type 
--genomeDir $RDS_PROJECT/ins_rna_seq/live/genomes/indexed_genomes \ #location of the indexed genome
--outFilterMultimapNmax 20 \
--alignIntronMin 20 \
--alignSJDBoverhangMin 1 \
--outFilterMismatchNoverReadLmax 0.04 \
--alignMatesGapMax 1000000 \
--limitBAMsortRAM 12000000000 \
--outFilterMismatchNmax 99 \
--alignIntronMax 1000000 \
--alignSJoverhangMin 8 \
--readFilesCommand zcat \
--readFilesIn \ #read all these files in:
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/trim_output/${prefix}_R1_001_merged_val_1.fq.gz \ 
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/trim_output/${prefix}_R2_001_merged_val_2.fq.gz
done

