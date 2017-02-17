# Rawdata processing protocols for RefEx

## Original resources

### EST (Expressed sequence tag)
Expressed sequence tag (EST) data were originally obtained from the EST division of the INSD(International Nucleotide Sequence Database, consisting of Genbank/DDBJ/ENA).

 - human: [INSD](http://www.insdc.org/)
 - mouse: [INSD](http://www.insdc.org/)
 - rat: [INSD](http://www.insdc.org/)

### GeneChip
GeneChip data were previously measured by Affymetrix microarrays (GeneChip®), and calculated based on a typical microarray data analysis method8. We extracted the microarray data deposited in the NCBI GEO database for our reference dataset (tissue-specific patterns of mRNA expression).

 - human: [GSE7307](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE7307) (Human body index - transcriptional profiling)
 - mouse: [GSE10246](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE10246) (GNF Mouse GeneAtlas V3)
 - rat: [GSE952](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE952) (Transcriptome analysis in rat)

### CAGE (cap analysis of gene expression)
Cap analysis of gene expression (CAGE) is a technique that produces a snapshot of the 52 end of the mRNA population in a biological sample.

 - human: [PRJDB3010](https://www.ncbi.nlm.nih.gov/bioproject/303078) (A promoter level mammalian expression atlas (human, ChIP-Seq))
 - mouse: [PRJDB1100](https://www.ncbi.nlm.nih.gov/bioproject/245186) (FANTOM5 Mouse CAGE)
 - rat: not applicable

### RNA-seq
We extracted normal tissue transcriptome sequence data from the NCBI Sequence Read Archive (SRA). Corresponding expression level and location data came from the Illumina Bodymap 2 project for human and mouse transcriptomes.

 - human: [PRJEB2445](http://www.ebi.ac.uk/ena/data/view/PRJEB2445) (RNA-Seq of human individual tissues and mixture of 16 tissues (Illumina Body Map))
 - mouse: [PRJNA30467](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA30467) (Mapping and quantifying mammalian transcriptomes by RNA-Seq; brain, liver, muscle)
 - rat: not applicable


## Processing protocols
### EST
 The number of ESTs was counted by source organ, based on the [Bodymap method](https://www.ncbi.nlm.nih.gov/pubmed/?term=Okubo%20K%5BAuthor%5D&cauthor=true&cauthor_uid=1345164), according to the cDNA annotation of each EST entry. The EST data in RefEx comes from the [BodyMap\-Xs](http://nar.oxfordjournals.org/content/34/suppl_1/D628.full) database, where gene expression data from the INSD EST division was previously compiled for reuse.  
- Script for tag count: [EST\_tagcount\.pl](https://github.com/hiromasaono/RefEx/blob/master/Rawdata_Processing/EST_tagcount.pl)  
- Script for normalization: [EST\_norm\.pl](https://github.com/hiromasaono/RefEx/blob/master/Rawdata_Processing/EST_norm.pl)  

### GeneChip
 The expression values of the genes were calculated from the original CEL files after [robust multi‐array average \(RMA\)](https://doi.org/10.1093/biostatistics/4.2.249) normalization by the [affy](https://bioconductor.org/packages/release/bioc/html/affy.html) package in [R](https://www.r-project.org/) (ver.3.0.3) / [Bioconductor](https://www.bioconductor.org/) (ver.2.12).  
- Script: [GeneChip\_RMA\.r](https://github.com/hiromasaono/RefEx/blob/master/Rawdata_Processing/GeneChip_RMA.r)

### CAGE
 CAGE data collected in [the RIKEN FANTOM5 project](http://fantom.gsc.riken.jp/5/) were counted by source organ, based on original data, [FANTOM5 CAGE peaks expression, and annotation tables](http://fantom.gsc.riken.jp/5/datafiles/latest/extra/CAGE_peaks/). CAGE tag counts mapped to reference genome sequences reflect the intensity of gene expression of corresponding transcripts. Tag counts are normalized by Tag per million (TPM).
 - Sample annotation for human [\(DOI: 10\.6084/m9\.figshare\.4028685\)](https://dx.doi.org/10.6084/m9.figshare.4028685)
 - Sample annotation for mouse [\(DOI: 10\.6084/m9\.figshare\.4028688\)](https://dx.doi.org/10.6084/m9.figshare.4028688)

### RNA-seq
These data were processed using typical RNA-seq data analysis pipeline with [TopHat](https://ccb.jhu.edu/software/tophat/) (ver.2.0.7) and [Cufflinks](http://cole-trapnell-lab.github.io/cufflinks/) (ver.2.0.2), and transcript abundances were calculated and normalized to fragments per kilobase of transcript per million reads (FPKM).
- Script:

## Calculation for tissue specificity
RefEx contains unique lists of genes whose expression pattern is prominent in a specific tissue compared with other tissues. Those genes with tissue specific expression patterns are calculated for all tissues using the ROKU method [(Kadota et al., BMC Bioinformatics, 2006, 7:294)](http://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-7-294).  
ROKU was developed solely for this purpose. It ranks genes according to their overall tissue specificity using Shannon entropy, and detects tissues specific to each gene, if any exist, using an outlier detection method.   
See details: http://bioconductor.org/packages/release/bioc/manuals/TCC/man/TCC.pdf (page 22-24)  

- Script: [ROKU\.r](https://github.com/hiromasaono/RefEx/blob/master/Rawdata_Processing/ROKU.r), [ROKU\_AIC\.r](https://github.com/hiromasaono/RefEx/blob/master/Rawdata_Processing/ROKU_AIC.r)  


## Extraction of high-profile genes (Sort for "Gene2Pubmed")
The **gene2pubmed** dataset is a manually curated gene to PubMed literature relationship dataset provided by NCBI. Sorting genes by the number of corresponding literature citations in PubMed enables a user to sort by whether a gene is ‘famous’ or not.  
- Original source: ftp://ftp.ncbi.nlm.nih.gov/gene/DATA/gene2pubmed.gz  
- Script: [gene2pubmed\.pl](https://github.com/hiromasaono/RefEx/blob/master/Rawdata_Processing/gene2pubmed.pl)  


From the original source, each column of Tax_ID is obtained the following,

- human (Homo sapiens)  
Taxonomy ID: 9606  

- mouse (Mus musculus)  
Taxonomy ID: 10090  

- Rat (Rattus norvegicus)  
Taxonomy ID: 10116

Then count the number of pubmed IDs for each geneID.
