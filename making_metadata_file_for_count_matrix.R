#Creating metadata file for input into featureCounts

#Load in libraries required
library(DESeq2)
library(RColorBrewer)
library(gplots)
library(Rsubread)

#Set working directory
setwd("/Volumes/ec1016/projects/ins_rna_seq/live")

#Load in the file containing all of the samples sent for sequencing
aligned = read.delim("alignedsamplenames.txt")


#Allocate sample names as they appear on the HPC
for(i in 1:nrow(aligned)) {
  print(i)
  aligned$final_name[i] = paste("/rds/general/project/ins_rna_seq/live/STAR_output/",aligned$sample_num[i])
}
head(aligned)


#Remove the random space which got added in
for(i in 1:nrow(aligned)) {
  print(aligned$final_name[i])
  aligned$final_name[i] = sub(' ', '',aligned$final_name[i])
}
head(aligned)

#Save file
write.csv(aligned, "aligned_sample_names_v2.csv")








