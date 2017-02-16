source("http://bioconductor.org/biocLite.R")
biocLite("affy")
library(affy)
write.exprs(justRMA(), file="EXPRESSION_from_CELfiles.txt")
