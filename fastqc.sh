#To submit a job the following 2 lines need to be present:
#PBS -lselect=1:ncpus=10:mem=62gb #number of nodes (1), cores (10) and memory (62gb)
#PBS -lwalltime=06:00:00 #the longer the walltime, the larger the number, the lower down the queue the job is
#Can be submitted as a job or ran live if not many samples

#Load in module
module load fastqc

#FastQC code
fastqc 
  -t 10 #number of cores
  -d tmp #temporary directory name to put files which are being processed
  -o fastq_out #output directory name
  -f fastq $RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/*.fastq.gz #location of files needed to be fastqc-ed
