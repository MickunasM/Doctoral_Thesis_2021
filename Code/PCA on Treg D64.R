library(ggbiplot)
library(factoextra)
library(readxl)
library(devtools)
library(plyr)
library(scales)
library(grid)
library(usethis)

treg <- read_excel("Desktop/R - Thesis/DF/tregd64_2.xlsx")
treg.pca <- prcomp(treg[,c(3:9)], center = TRUE,scale. = TRUE)
summary(treg.pca)

#Screeplot - eigenvalue
screeplot(treg.pca, type = "l", npcs = 7, main = "Screeplot of PCs")
abline(h = 1, col="red", lty=5)
legend("topright", legend=c("Eigenvalue = 1"),
       col=c("red"), lty=5, cex=0.6)

#Screeplot percentage contribution - barplot
fviz_eig(treg.pca)

#Create DF for treatment groups
groups <- as.factor(treg$Treatment[1:20])

#PCA without variables
fviz_pca_ind(treg.pca,
             col.ind = groups, # color by groups
             palette = c("Blue", "Green", "Red"),
             addEllipses = TRUE, # Concentration ellipses
             ellipse.type = "norm",
             legend.title = "Treatment Group",
             repel = TRUE,
             geom = c("point"),
             pointsize = 3,
)

#Plot contribution of variables to PCs
fviz_pca_var(treg.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("Blue", "Orange", "Red"),
             repel = TRUE,
             legend.title = "Contribution to PC1 and PC2",
             geom = c("point", "text")
)

#PCA with variables and groups - no contribution
fviz_pca_biplot(treg.pca, repel = TRUE,
                pointsize = 3,
                col.var = "Black", # Variables color
                col.ind = groups, # Individuals color
                palette = c("Blue", "Green", "Red"),
                addEllipses = TRUE,
                ellipse.type = "t",
                legend.title = "Treatment Group",
                geom = c("point"),
)

