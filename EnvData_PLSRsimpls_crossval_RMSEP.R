library(pls)

setwd("/Users/WorkingDirectory")
Alldata <- read.csv(file="env_all_data.csv")
response_var <- read.csv(file="response_data.csv", header=TRUE, row.names = 1,sep=",");
regressor_var <- read.csv(file="regressor_data.csv", header=TRUE, row.names = 1,sep=",");
response_matrix <- as.matrix(response_var)
regressor_matrix <- as.matrix(regressor_var)

#PLSR_Simpls and Leave one out cross validation "L00"
BeninPLSR_simpls <- plsr(response_matrix ~ regressor_matrix, data = beninall, method = "simpls", validation = "LOO")
summary(BeninPLSR_simpls)

coefficients <- BeninPLSR_simpls$coefficients
write.csv(coefficients, "Coefficients.csv")
explvar(BeninPLSR_simpls)
plot(MSEP(BeninPLSR_simpls))

pdf("RMSEP.pdf", height = 7, width =11)
plot(RMSEP(BeninPLSR_simpls))
dev.off()

BeninPLSR_simpls$scores
BeninPLSR_simpls$loadings
BeninPLSR_simpls$fitted.values
plot(BeninPLSR_simpls, "biplot")
coefplot(BeninPLSR_simpls, ncomp = 1:6)
