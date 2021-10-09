#Making count matrices

library(DESeq2)
library(RColorBrewer)
library(gplots)
library(Rsubread)

#Set working directory
setwd("/Volumes/ec1016/projects/ins_rna_seq/live")

#Load in the metadata
metadata = read.delim("Sample_list_sent_for_sequencing.txt", header=T)
head(metadata)

files <- file.path("/Volumes/ec1016/projects/ins_rna_seq/live/STAR_output", paste0(metadata$INS_num,"Aligned.sortedByCoord.out.bam"))


fc<-featureCounts(files=files,annot.ext="/Volumes/ec1016/projects/ins_rna_seq/live/genomes/unindexed/GCF_000001405.39_GRCh38.p13_genomic.gtf",isGTFAnnotationFile=TRUE,isPairedEnd=TRUE)








