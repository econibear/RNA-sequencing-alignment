#To submit a job the following 2 lines need to be present:
#PBS -lselect=1:ncpus=1:mem=64gb  #number of nodes (1), cores (1) and memory (64gb) - featureCounts can use more than 1 core but didn't know how and wasn't worth fighting for
#PBS -lwalltime=24:00:00 #the longer the walltime, the larger the number, the lower down the queue the job is

#Go to this location
cd $RDS_PROJECT/ins_rna_seq/live

#Load in anaconda to run an updated version of R
module load anaconda3/personal

#Run this R script
Rscript count_matrix.R

