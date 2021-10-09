<h1> RNA-sequencing pre processing </h1>

Prior to analysing RNA-sequencing data, you need to pre process the data. This entails:

<ol>
  <li>Trimming off adapter sequences and removing low quality reads <i>(Trim Galore!)</i></li>
  <li>QC-ing the results <i>(FastQC & MultiQC)</i></li>
  <li>Aligning the reads to a genome <i>(STAR Align)</i></li>
  <li> Creating a read count matrix <i>(DESeq2 - Feature Counts)</i></li>
</ol>

<h2> Trim Galore! </h2>

<a href="https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md">User guide</a> for Trim Galore!

<code> code </code>
