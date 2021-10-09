#To submit a job the following 2 lines need to be present:
#PBS -lselect=1:ncpus=8:mem=62gb  #number of nodes (1), cores (8) and memory (62gb)
#PBS -lwalltime=48:00:00 #the longer the walltime, the larger the number, the lower down the queue the job is

#Load in anaconda
#Need this to activate a more updated python to run trim galore with more than 1 core
module load anaconda3/personal 
source activate python3

#Load in the modules needed
module load trim_galore 
module load cutadapt

#Go to folder with merged fasta files in
cd $RDS_PROJECT/ins_rna_seq/live/final_mergedfasta

#Trim Galore! loop
for prefix in $(ls *.fastq.gz | sed -r 's/_R[12]_001_merged.fastq.gz//' | uniq)
do 
trim_galore \ #initiate trim galore
#--cores 8 #choose number of cores but this didn't work for some reason :(
--illumina \ #this was the platform we used, saves the default auto detection method
-o trim_output \ #output directory location
--length 60 \ #discard reads that became shorter than this length after quality or adapter trimming
-q 25 \ #remove reads with phred score below this number
--paired \ #determine if reads are paired or not and where their location is
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/${prefix}_R1_001_merged.fastq.gz \
$RDS_PROJECT/ins_rna_seq/live/final_mergedfasta/${prefix}_R2_001_merged.fastq.gz 
done

source deactivate

