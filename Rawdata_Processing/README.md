# Rawdata processing protocols for RefEx
## Original resources

### EST (Expressed sequence tag)
Expressed sequence tag (EST) data were originally obtained from the EST division of the INSD(International Nucleotide Sequence Database, consisting of Genbank/DDBJ/ENA).

human,mouse,rat: INSD

### GeneChip
GeneChip data were previously measured by Affymetrix microarrays (GeneChip®), and calculated based on a typical microarray data analysis method8. We extracted the microarray data deposited in the NCBI GEO database for our reference dataset (tissue-specific patterns of mRNA expression).

human: GSE7307(Human body index - transcriptional profiling)
mouse: GSE10246(GNF Mouse GeneAtlas V3)
rat: GSE952(Transcriptome analysis in rat)

### CAGE (cap analysis of gene expression)
Cap analysis of gene expression (CAGE) is a technique that produces a snapshot of the 52 end of the mRNA population in a biological sample.

human: PRJDB3010 (A promoter level mammalian expression atlas (human, ChIP-Seq))
mouse: PRJDB1100 (FANTOM5 Mouse CAGE)

### RNA-seq
We extracted normal tissue transcriptome sequence data from the NCBI Sequence Read Archive (SRA). Corresponding expression level and location data came from the Illumina Bodymap 2 project for human and mouse transcriptomes.

human: PRJEB2445 (RNA-Seq of human individual tissues and mixture of 16 tissues (Illumina Body Map))
mouse: PRJNA30467(Mapping and quantifying mammalian transcriptomes by RNA-Seq; brain, liver, muscle)

## Protocols
### EST
 The number of ESTs was counted by source organ, based on the Bodymap method, according to the cDNA annotation of each EST entry. The EST data in RefEx comes from the BodyMap-Xs database, where gene expression data from the INSD EST division was previously compiled for reuse.

### GeneChip
 The expression values of the genes were calculated from the original CEL files after robust multi-array averaging (RMA) normalization by the affy package in R/Bioconductor.

### CAGE
 CAGE data collected in the RIKEN FANTOM5 project were counted by source organ, based on original data, FANTOM5 CAGE peaks expression, and annotation tables. CAGE tag counts mapped to reference genome sequences reflect the intensity of gene expression of corresponding transcripts. Tag counts are normalized by Tag per million (TPM).

### RNA-seq
These data were processed using typical RNA-seq data analysis pipeline with TopHat and Cufflinks, and transcript abundances were calculated and normalized to fragments per kilobase of transcript per million reads (FPKM).
