source("http://bioconductor.org/biocLite.R")
biocLite("affy")
library(affy)
write.exprs(justRMA(), file="RMA.txt")
