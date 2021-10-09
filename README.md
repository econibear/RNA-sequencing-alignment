<h1> RNA-sequencing analysis </h1>

Prior to analysing RNA-sequencing data, you need to pre process the data. This entails:

<ol>
  <li>Trimming off adapter sequences and removing low quality reads <i>(Trim Galore!)</i></li>
  <li>QC-ing the results <i>(FastQC & MultiQC)</i></li>
  <li>Aligning the reads to a genome <i>(STAR Align)</i></li>
  <li> Creating a read count matrix <i>(DESeq2 - Feature Counts)</i></li>
</ol>

After pre processing, normalisation and multiple QC steps occurs before the generation of differentially expressed gene (DEG) lists

<h2> Trim Galore! </h2>

<a href="https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md">User guide</a> for Trim Galore!

<h2> FastQC </h2>

<a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">FastQC</a> is a tool for quality controlling high throughput sequence data. It gives you a html and txt file report for each sample. If you have lots of samples, use MultiQC to combine them all together in an easy to look format.

<code> module load multiqc </code> <br>
<code> source activate multiqc </code> <br>
<code> multiqc -n trimmed_multiqc_report . #combines all files in the current directory </code> <br>
<code> source deactivate multiqc </code>


<h2> STAR align </h2> 

<a href="https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/lessons/03_alignment.html">Helpful guide</a> for STAR align. Use this package to both index the genome and perfom the alignment. Here we downloaded the gtf and fna files of the GRCh38.p13 genome from <a href="https://www.ncbi.nlm.nih.gov/assembly/GCF_000001405.39">the NCBI website</a>.


<h2> Feature counts</h2>

We did this by loading the files straight into R.


<h2> Submitting jobs </h2>

<ul>

 <li><code> qsub [script name]</code> submits the job </li>
  <li><code> bash [script name]</code> runs the job live </li>
  <li><code> qstat [script name]</code> checks status of the job </li>
  </ul>
