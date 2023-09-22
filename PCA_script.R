
##clear environment 
rm(list=ls())

##read in packages/data
library(adegenet)
library(ape)
library(pegas)
library(factoextra)


data<- read.genepop(file = "multi-populations.snps.gen", ncode = 2)

##make frequency distribution table
x.dat<- tab(data, freq=TRUE, NA.method = "mean")

##use that for pca
## https://www.rdocumentation.org/packages/ade4/versions/1.7-22/topics/dudi.pca
pca.dat<- dudi.pca(x.dat, center = TRUE, scale = FALSE, scannf = FALSE)



## make scatterplot from pca data
s.class(pca.dat$li, fac=pop(data), col=funky(15))

### add eigenvalues
add.scatter.eig(pca.dat$eig[1:20],3,1,2, ratio=.3,  posi = "bottomright")
title("PCA of All_Sites dataset\naxes 1 & 2")




### maybe try this plot out for individual representation?
fviz_pca_ind(pca.dat,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
