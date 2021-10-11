#PBS -lselect=1:ncpus=1:mem=64gb
#PBS -lwalltime=24:00:00

cd $RDS_PROJECT/ins_rna_seq/live

module load anaconda3/personal

Rscript count_matrix.R

