#Set working directory
setwd("/rds/general/project/ins_rna_seq/live/")

#Load in required packages
library(DESeq2)
library(RColorBrewer)
library(gplots)
library(Rsubread)

#Load in file with metadata in
aligned = read.csv("aligned_sample_names_v2.csv")

#For some reason it makes files a factor, so convert this to character for featureCounts
files <- aligned$final_name
files1 = as.character(files)

#featureCounts run
fc<-featureCounts(files=files1,
                  annot.ext="/rds/general/project/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf",
                  isGTFAnnotationFile=TRUE,
                  isPairedEnd=TRUE)

#Save output as a text file
write.table(fc,"featureCounts_matrix.txt")
