library(superheat)
library(ggplot2)
library(ape)
library(data.tree)

setwd("/Users/workingdirectory")

#Envirem and WC2 data
biovar9 <- read.csv(file="BioVar9.csv", header=TRUE, row.names = 1,sep=",");
head(benin9 , 3)

#scale data from 0 to 1 with quantile preserving scale
biovar9s <- apply(biovar9, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X)))

#Superheat bio varariables
superheat(as.matrix(biovar9s),
          pretty.order.cols = TRUE,
          col.dendrogram = TRUE,
          clustering.method = c("hierarchical"),
          dist.method = c("euclidean"),
          linkage.method = c("ward.D2"),
          force.left.label = TRUE,
          left.label =  "variable",
          left.label.size = .11,
          left.label.text.size = 2,
          force.bottom.label = TRUE,
          bottom.label = "variable",
          bottom.label.size = .2,
          bottom.label.text.size = 2,
          bottom.label.text.angle = 90,
          grid.vline.size = 0.09,
          smooth.heat = TRUE)
dev.off()