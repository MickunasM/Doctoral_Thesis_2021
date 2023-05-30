library(ggbiplot)
library(factoextra)
library(readxl)
library(devtools)
library(plyr)
library(scales)
library(grid)
library(usethis)

non_treg <- read_excel("Desktop/R - Thesis/DF/non-tregd64.xlsx")
non_treg.pca <- prcomp(non_treg[,c(3:14)], center = TRUE,scale. = TRUE)
summary(non_treg.pca)

#Screeplot - eigenvalue
screeplot(non_treg.pca, type = "l", npcs = 12, main = "Screeplot of PCs")
abline(h = 1, col="red", lty=5)
legend("topright", legend=c("Eigenvalue = 1"),
       col=c("red"), lty=5, cex=0.6)

#Screeplot percentage contribution - barplot
fviz_eig(non_treg.pca)

#Create DF for treatment groups
groups2 <- as.factor(non_treg$Treatment[1:28])

#PCA without variables
fviz_pca_ind(non_treg.pca,
             col.ind = groups2, # color by groups
             palette = c("Blue", "Green", "Red"),
             addEllipses = TRUE, # Concentration ellipses
             ellipse.type = "norm",
             legend.title = "Treatment Group",
             repel = TRUE,
             geom = c("point"),
             pointsize = 3,
)

#Plot contribution of variables to PCs
fviz_pca_var(non_treg.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("Blue", "Orange", "Red"),
             repel = TRUE,
             legend.title = "Contribution to PC1 and PC2",
             geom = c("point", "text")
)

#PCA with variables and groups - no contribution
fviz_pca_biplot(non_treg.pca, repel = TRUE,
                pointsize = 3,
                col.var = "Black", # Variables color
                col.ind = groups2, # Individuals color
                palette = c("Blue", "Green", "Red"),
                addEllipses = TRUE,
                ellipse.type = "t",
                legend.title = "Treatment Group",
                geom = c("point"),
)

