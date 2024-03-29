#install.packages("GenPopReport")

library(adegenet)
library(PopGenReport)
library(plotrix)
library(poppr)

setwd("C:/Users/miaadcock/wheeleri")

# Read in Multiple HAPS Genepop file (with .gen ending) from Stacks.

data <- read.genepop(file="populations.haps.gen")

# Print the Levels (i.e., Sites) used by Genepop to delinate populations.

data$pop

# Create a list of Sites

Populations <- c("BF_TFK6", "C537", "AV9-O", "AVPA-9", "AVVA-99","AVWA-003", "Turkey_5", "Mulberry_5", "Deep_5", "Chatt_6", "Cacapon_5", "RR_1", "Wilson_2", "M_1", "ALVA7", "AVWR9", "BFMA6", "AVEBP-020", "AVFA-019", "AVLI-015", "AVNIS-009", "AVPCO-020", "AVPE-015", "AVTR-020", "AVWE-033")

# Create an empty dataframe to store Allelic Richness and Standard Error values by Site.

AR = data.frame("Site","AR","SE")

# Run For Loop. For each site, data is subsetted from the original Genepop file.
# Then Allelic Richness is calculated using allel.rich for that Site.
# The Allelic Richness and Standard Error Values are amended to the data.frame.

for (i in Populations) {
  Subpop <- popsub(data, sublist = i)
  richness<-allel.rich(Subpop, min.alleles=NULL)
  ARnum <- round(mean(richness$all.richness),digits=3)
  SEnum <- round(std.error(richness$all.richness),digits=4)
  AR <- rbind(AR, list(i,ARnum,SEnum))
}

