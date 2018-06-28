#Parasite/host superheat
devtools::install_github("rlbarter/superheat")
library(superheat)
library(ggplot2)
library(ape)
library(data.tree)

setwd("/Users/workingdirectory")
benin <- read.csv(file="parasite_host_data.csv",header=TRUE, row.names = 1,sep=",");
head(benin, 3)

#Replace 0's with NA
benin[benin == 0] <- NA

pdf("parasite_host_superheat.pdf", height = 11, width =8)
superheat(as.matrix(benin),
          force.left.label = TRUE,
          left.label =  "variable",
          left.label.size = .11,
          left.label.text.size = 2,
          force.bottom.label = TRUE,
          bottom.label = "variable",
          bottom.label.size = .2,
          bottom.label.text.size = 2,
          bottom.label.text.angle = 90,
          grid.hline.size = 0.09,
          grid.vline.size = 0.09,
          force.grid.vline = TRUE,
          force.grid.hline = TRUE,
          smooth.heat = TRUE,
          heat.na.col = "white")
dev.off()