#PBS -lselect=1:ncpus=8:mem=64gb
#PBS -lwalltime=72:00:00

cd $RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/trim_output

module load gcc/6.2.0 star/2.7.1a

for prefix in $(ls *.fq.gz | sed -r 's/_R[12]_001_merged_val_[12].fq.gz//' | uniq)
do
STAR \
--runThreadN 8 \
--outFileNamePrefix $RDS_PROJECT/ins_rna_seq/live/STAR_output/${prefix} \
--outSAMattributes NH HI AS NM MD \
--runMode alignReads \
--quantMode TranscriptomeSAM GeneCounts \
--sjdbGTFfile $RDS_PROJECT/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf \
--genomeLoad NoSharedMemory \
--outSAMunmapped Within \
--outSAMtype BAM SortedByCoordinate \
--genomeDir $RDS_PROJECT/ins_rna_seq/live/genomes/indexed_genomes \
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
--readFilesIn \
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/trim_output/${prefix}_R1_001_merged_val_1.fq.gz \
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/trim_output/${prefix}_R2_001_merged_val_2.fq.gz
done

