#PBS -lselect=1:ncpus=8:mem=62gb
#PBS -lwalltime=48:00:00

module load anaconda3/personal
source activate python3

module load trim_galore
module load cutadapt

cd $RDS_PROJECT/ins_rna_seq/live/final_mergedfasta

for prefix in $(ls *.fastq.gz | sed -r 's/_R[12]_001_merged.fastq.gz//' | uniq)
do 
trim_galore \
--illumina \
-o trim_output \
--length 60 \
-q 25 \
--paired \
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/${prefix}_R1_001_merged.fastq.gz \
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/${prefix}_R2_001_merged.fastq.gz
done

source deactivate
