setwd("/rds/general/project/ins_rna_seq/live/")

library(DESeq2)
library(RColorBrewer)
library(gplots)
library(Rsubread)

aligned = read.csv("aligned_sample_names_v2.csv")
files <- aligned$final_name
files1 = as.character(files)


fc<-featureCounts(files=files1,
                  annot.ext="/rds/general/project/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf",
                  isGTFAnnotationFile=TRUE,
                  isPairedEnd=TRUE)
write.table(fc,"featureCounts_matrix.txt")