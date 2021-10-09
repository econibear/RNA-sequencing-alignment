<h1> RNA-sequencing analysis </h1>

Prior to analysing RNA-sequencing data, you need to pre process the data. This entails:

<ol>
  <li>Trimming off adapter sequences and removing low quality reads <i>(Trim Galore!)</i></li>
  <li>QC-ing the results <i>(FastQC & MultiQC)</i></li>
  <li>Aligning the reads to a genome <i>(STAR Align)</i></li>
  <li> Creating a read count matrix <i>(DESeq2 - Feature Counts)</i></li>
</ol>

After pre processing, normalisation and QC occurs before the generation of differentially expressed gene (DEG) lists

<h2> Trim Galore! </h2>

<a href="https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md">User guide</a> for Trim Galore!




<h2> Submitting jobs </h2>

<ul>

 <li><code> qsub [script name]</code> submits the job </li>
  <li><code> bash [script name]</code> runs the job live </li>
  <li><code> qstat [script name]</code> checks status of the job </li>
  </ul>
