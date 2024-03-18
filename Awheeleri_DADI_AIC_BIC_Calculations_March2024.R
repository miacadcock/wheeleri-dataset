# Set Working Directory
setwd("C:/Users/pred9/Desktop/AU_PhD/Mia_Awheeleri")

# For Weighted AIC Calculations
library(MuMIn)

# Data from my models
# Order: SNM, Growth, Two-Epoch, BottleGrowth, Three-Epoch.
# DADI likelihood values are log10 likelihoods.
aa <- c(-714.81, -30.29, -25.83, -24.45, -23.71)*2.303 # Convert from log10 to ln
b <- c(0, 2, 2, 3, 4) # Number of estimated parameters

# Calculate AIC Values
aic <- 2*b-2*aa
print(aic)

# Calculate Delta AIC to determine the Best-Fit Model
delta_aic <-(aic) - min((aic))
print(delta_aic)

# Calculate Weighted AIC to Evaluate Significance of Models.
AICw <- Weights(aic)
print(AICw)

# Calculate BIC Values
bic <- log(12)*b-2*aa
print(bic)

# Calculate Delta BIC to determine the Best-Fit Model
delta_bic <-(bic) - min((bic))
print(delta_bic)

# Calculate Weighted AIC to Evaluate Significance of Models.
BICw <- Weights(bic)
print(BICw)
