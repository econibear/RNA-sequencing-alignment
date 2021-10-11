<h1> RNA-sequencing analysis </h1>

Prior to analysing RNA-sequencing data, you need to pre process the data. This entails:

<ol>
  <li>Quality and adapter trimming <i>(Trim Galore!)</i></li>
  <li>QC-ing the results <i>(FastQC & MultiQC)</i></li>
  <li>Aligning to a genome <i>(STAR Align)</i></li>
  <li> Creating a read count matrix <i>(DESeq2 - Feature Counts)</i></li>
</ol>

After pre processing, normalisation and multiple QC steps occurs before the generation of differentially expressed gene (DEG) lists.

<h2> Trim Galore! </h2>

<a href="https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md">User guide</a> for Trim Galore! This removes adapter sequences as well as low quality reads.

<h2> FastQC & MultiQC</h2>

<a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">FastQC</a> is a tool for quality controlling high throughput sequence data. It gives you a html and txt file report for each sample. If you have lots of samples, use <a href="https://multiqc.info/">MultiQC</a> to combine them all together in an easy to see format.

<code> module load multiqc </code> <br>
<code> source activate multiqc </code> <br>
<code> multiqc -n trimmed_multiqc_report . #combines all files in the current directory </code> <br>
<code> source deactivate multiqc </code>


<h2> STAR align </h2> 

<a href="https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/lessons/03_alignment.html">Helpful guide</a> for STAR align. Use this package to both index the genome and perfom the alignment. Here we downloaded the gtf and fna files of the GRCh38.p13 genome from <a href="https://www.ncbi.nlm.nih.gov/assembly/GCF_000001405.39">the NCBI website</a>.


<h2> Feature counts</h2>

To get this we first had to create a text file containing the sample numbers and timepoints. The R script called <code>making_metadata_file_for_count_matrix.R</code> creates this file from the list of file names directly from the STAR output folder. Then, as this takes a long time, we ran the creation of the count matrix through the HPC using featureCounts from the DESeq2 package. <code>count_matrix.R</code> was the R script used inside the <code>count_matrix_v2.sh</code>.


<h2> Submitting jobs </h2>

<ul>

 <li><code> qsub [script name]</code> submits the job </li>
  <li><code> bash [script name]</code> runs the job live </li>
  <li><code> qstat [script name]</code> checks status of the job </li>
  </ul>
