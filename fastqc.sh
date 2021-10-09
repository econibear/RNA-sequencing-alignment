#PBS -lselect=1:ncpus=10:mem=62gb
#PBS -lwalltime=06:00:00

fastqc -t 10 -d tmp -o fastq_out -f fastq $RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/*.fastq.gz
