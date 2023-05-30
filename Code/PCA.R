library(readxl)
library(devtools)
library(ggbiplot)

#Data frame prep for PCA
WB_D64 <- read_excel("Desktop/R - Thesis/WB_D64.xlsx")
wbd64.pca <- prcomp(WB_D64[,c(3:9)], center = TRUE,scale. = TRUE)

#plot PCA
ggbiplot(wbd64.pca)

#make a list for treatment groups
wbd64.dose <- c(rep("2MIU IL-2", 12), rep("1MIU IL-2",12), rep("Placebo", 12))
wbd64.dose

#draw an ellipse around each treatment group in PCA
ggbiplot(wbd64.pca,ellipse=TRUE, groups=wbd64.dose)

#plot other principal components
ggbiplot(wbd64.pca,ellipse=TRUE,choices=c(3,4), groups=wbd64.dose) 

#scale + size+ manual coloring
  
ggbiplot(wbd64.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1, groups=wbd64.dose) +
  geom_point(size = 3, aes(color = groups)) + 
  scale_colour_manual(name="Treatment Group", values= c("Blue", "Green", "Red")) +
  theme(text = element_text(size = 15))   
  




