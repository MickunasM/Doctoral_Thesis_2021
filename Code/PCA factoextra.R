library(factoextra)
Treg_D64 <- read_excel("Desktop/GitHub/Thesis_Data/Treg_D64.xlsx")
treg64.pca <- prcomp(Treg_D64[,c(3:9)], center = TRUE,scale. = TRUE)
summary(treg64.pca)

#Screeplot
screeplot(treg64.pca, type = "l", npcs = 7, main = "Screeplot of PCs")
abline(h = 1, col="red", lty=5)
legend("topright", legend=c("Eigenvalue = 1"),
       col=c("red"), lty=5, cex=0.6)

groups <- as.factor(Treg_D64$Treatment[1:28])

fviz_pca_var(treg64.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
             )

fviz_pca_biplot(treg64.pca, repel = TRUE,
                pointsize = 3,
                col.var = "Black", # Variables color
                col.ind = groups, # Individuals color
                palette = c("Blue", "Green", "Red"),
                addEllipses = TRUE,
                ellipse.type = "norm",
                legend.title = "Treatment Group",
                geom = c("point")
                )

