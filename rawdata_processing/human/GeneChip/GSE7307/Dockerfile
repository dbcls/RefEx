# Docker container for rawdata processing GSE7307 in RefEx
FROM bioconductor/release_core
MAINTAINER Hiromasa Ono, hono@dbcls.rois.ac.jp

# Install packages
RUN 	apt-get update && \
	apt-get install -y wget

# RAW data download (only normal tissue samples) from NCBI GEO
RUN	wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM175nnn/GSM175789/suppl/GSM175789.CEL.gz && \
	wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM175nnn/GSM175792/suppl/GSM175792.CEL.gz && \
	wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM175nnn/GSM175795/suppl/GSM175795.CEL.gz 

# robust multi-array (RMA) for background correction, normalization and polishing with R/bioconductor
RUN 	R -e "biocLite('affy', ask=TRUE)" && \
	R -e "library(affy)" && \
	R -e "write.exprs(justRMA(), file='RMA_GSE7307_expression.txt')"
	

CMD ["bash"]
