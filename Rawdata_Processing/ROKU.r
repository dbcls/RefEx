in_f <- "INPUT.txt"
out_f <- "OUTPUT.txt"
source("ROKU_AIC.r")
library(affy)
data <- read.table(in_f, header=TRUE, row.names=1, sep="\t", quote="")
library(som)
data.z <- normalize(data, byrow=TRUE)
out <- t(apply(data.z, 1, AIC_0.25))
colnames(out) <- colnames(data)
entropy_score <- apply(data, 1, kadota_2006_bmc_bioinformatics)
tmp <- cbind(rownames(data), out, entropy_score)
write.table(tmp, out_f, sep="\t", append=F, quote=F, row.names=F) 
