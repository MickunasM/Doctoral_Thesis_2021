library(ggbiplot)
library(factoextra)
library(readxl)
library(devtools)
library(plyr)
library(scales)
library(grid)
library(usethis)

all_D85 <- read_excel("Desktop/R - Thesis/DF/All_D85_Deltas.xlsx")
all85.pca <- prcomp(all_D85[,c(3:11)], center = TRUE,scale. = TRUE)
summary(all85.pca)

#Screeplot - eigenvalue
screeplot(all85.pca, type = "l", npcs = 9, main = "Screeplot of PCs")
abline(h = 1, col="red", lty=10)
legend("topright", legend=c("Eigenvalue = 1"),
       col=c("red"), lty=5, cex=0.6)

#Screeplot percentage contribution - barplot
fviz_eig(all85.pca)

#Create DF for treatment groups
groups <- as.factor(all_D85$Treatment[1:27])

#PCA without variables
fviz_pca_ind(all85.pca,
             col.ind = groups, # color by groups
             palette = c("Blue", "Green", "Red"),
             addEllipses = TRUE, # Concentration ellipses
             ellipse.type = "confidence",
             legend.title = "Treatment Group",
             repel = TRUE,
             geom = c("point"),
             pointsize = 3,
             textsize = 5,
             font.x = c(15,"plain","black"), font.y =  c(15,"plain","black"),
             font.xtickslab = c(12,"plain","black"), font.ytickslab =  c(12,"plain","black"),
             #ggtheme = theme(legend.title = element_text(size = 15), legend.text = element_text(size = 12))
             )
             

#Plot contribution of variables to PCs
fviz_pca_var(all85.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("Blue", "Orange", "Red"),
             repel = TRUE,
             legend.title = "Contribution to PC1 and PC2",
             geom = c("point", "text"),
             font.x = c(15,"plain","black"), font.y =  c(15,"plain","black"),
             font.xtickslab = c(12,"plain","black"), font.ytickslab =  c(12,"plain","black"),
             #ggtheme = theme(legend.title = element_text(size = 15), legend.text = element_text(size = 12))
             )
             
             

#PCA with variables and groups - no contribution
fviz_pca_biplot(all85.pca, repel = TRUE,
                pointsize = 3,
                col.var = "Black", # Variables color
                col.ind = groups, # Individuals color
                palette = c("Blue", "Green", "Red"),
                addEllipses = TRUE,
                ellipse.type = "confidence",
                legend.title = "Treatment Group",
                geom = c("point"),
                textsize = 5,
                font.x = c(15,"plain","black"), font.y =  c(15,"plain","black"),
                font.xtickslab = c(12,"plain","black"), font.ytickslab =  c(12,"plain","black"),
                ggtheme = theme(legend.title = element_text(size = 15), legend.text = element_text(size = 12))
                )
                




