library(stringr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(Hmisc)
library(viridisLite)
library(viridis)
library(rstatix)
library(reshape2)
library(broom)
library(tibble)
library(ggrepel)
library(pheatmap)
library(factoextra)
library(readxl)
library(PairedData)
library(ggpubr)
library(ggsignif)
library(emmeans)
library(tidyverse)
library(rebus)
library(writexl)


medians <- read.csv("~/Desktop/OneDrive - King's College London/R/PhD Data/PBMC FLOW/Treg MT MED.csv", check.names=F)

medians <- medians[-c(1:7, 10, 18, 23, 24, 25, 26)]
colnames(medians)[c(1,2,3,4,5,6,7,8,9,10,11,12,13 )] <- c("FoxP3","CD45RA","CD27","CD31", "CD15s", "HLA-DR", "ICOS", "CD39", "PD-1", "Ki-67", "CD25", "CD49d", "Helios")
rownames(medians)[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18 )] <- c("Subpopulation 1", "Subpopulation 2", "Subpopulation 3", "Subpopulation 4", "Subpopulation 5", "Subpopulation 6", "Subpopulation 7", "Subpopulation 8", "Subpopulation 9", "Subpopulation 10","Subpopulation 11", "Subpopulation 12", "Subpopulation 13", "Subpopulation 14", "Subpopulation 15", "Subpopulation 16", "Subpopulation 17", "Subpopulation 18")

medians64 <- medians[ -c(2, 3, 4, 6, 9, 13, 14, 15, 16, 17, 18), ]

medians85 <- medians[ -c(1, 3, 6, 8, 10, 11, 12, 13, 15, 16, 17), ]

medians169 <- medians[ -c(1, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18), ]

scale_medians <- scale(medians[, 1:13]) #scales based on (normalises)?


pheatmap(medians,
         cutree_rows = 3, cutree_cols = 2, fontsize = 15, fontsize_row = 15,
         cellwidth = 30, cellheight = 20,
         treeheight_row = 25, treeheight_col = 25,
         main = "",
         angle_col = 45,
         show_rownames = TRUE)

pheatmap(medians64,
         cutree_rows = 2, cutree_cols = 2, fontsize = 15, fontsize_row = 15,
         cellwidth = 30, cellheight = 20,
         treeheight_row = 25, treeheight_col = 25,
         main = "",
         angle_col = 45,
         show_rownames = TRUE)

pheatmap(medians85,
         cutree_rows = 2, cutree_cols = 2, fontsize = 15, fontsize_row = 15,
         cellwidth = 30, cellheight = 20,
         treeheight_row = 25, treeheight_col = 25,
         main = "",
         angle_col = 45,
         show_rownames = TRUE)

pheatmap(medians169,
         cutree_rows =, cutree_cols = 2, fontsize = 15, fontsize_row = 15,
         cellwidth = 30, cellheight = 20,
         treeheight_row = 25, treeheight_col = 25,
         main = "",
         angle_col = 45,
         show_rownames = TRUE)

pheatmap(medians[, 1:13],
         cutree_rows = 2, cutree_cols = 2, fontsize = 10, fontsize_row = 10,
         cellwidth = 30, cellheight = 20,
         treeheight_row = 25, treeheight_col = 25,
         main = "Aggregate Medians of Treg Subpopulations",
         angle_col = 45,
         show_rownames = TRUE)





