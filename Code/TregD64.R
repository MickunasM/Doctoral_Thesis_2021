library(readxl)
library(devtools)
library(ggbiplot)

#Data frame prep for PCA
Treg_D64 <- read_excel("Desktop/R - Thesis/Treg_D64.xlsx")
treg64.pca <- prcomp(Treg_D64[,c(3:9)], center = TRUE,scale. = TRUE)

#plot PCA
ggbiplot(treg64.pca)

#make a list for treatment groups
treg64.dose <- c(rep("2MIU IL-2", 10), rep("1MIU IL-2",10), rep("Placebo", 8))
treg64.dose

#draw an ellipse around each treatment group in PCA
ggbiplot(treg64.pca,ellipse=TRUE, groups=treg64.dose)

#plot other principal components
ggbiplot(treg64.pca,ellipse=TRUE,choices=c(3,4), groups=treg64.dose) 

#scale + size+ manual coloring

ggbiplot(treg64.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1, groups=treg64.dose) +
  geom_point(size = 3, aes(color = groups)) + 
  scale_colour_manual(name="Treatment Group", values= c("Blue", "Green", "Red")) +
  theme(text = element_text(size = 15))   





