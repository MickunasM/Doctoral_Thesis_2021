library(ggbiplot)
library(factoextra)
library(readxl)
library(devtools)
library(plyr)
library(scales)
library(grid)
library(usethis)

all <- read_excel("Desktop/R - Thesis/DF/all_days_5.xlsx")
all.pca <- prcomp(all[,c(3:19)], center = TRUE,scale. = TRUE)
summary(all.pca)

#Screeplot - eigenvalue
screeplot(all.pca, type = "l", npcs = 17, main = "Screeplot of PCs")
abline(h = 1, col="red", lty=5)
legend("topright", legend=c("Eigenvalue = 1"),
       col=c("red"), lty=5, cex=0.6)

#Screeplot percentage contribution - barplot
fviz_eig(all.pca)

#Create DF for treatment groups
groups <- as.factor(all$Treatment[1:17])

#PCA without variables
fviz_pca_ind(all.pca,
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
fviz_pca_var(all.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("Blue", "Orange", "Red"),
             repel = TRUE,
             legend.title = "Contribution to PC1 and PC2",
             geom = c("point", "text")
)

#PCA with variables and groups - no contribution
fviz_pca_biplot(all.pca, repel = TRUE,
                pointsize = 3,
                col.var = "Black", # Variables color
                col.ind = groups, # Individuals color
                palette = c("Blue", "Green", "Red"),
                addEllipses = TRUE,
                ellipse.type = "t",
                legend.title = "Treatment Group",
                geom = c("point"),
)

