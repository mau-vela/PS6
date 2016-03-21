library(devtools)
library(roxygen2)
setwd("C:/Users/MauricioAndresVela/Documents/R/Clase/PS6")

package.skeleton(code_files = c("primaryRacePack-package.R", "Candidate.R", 
                                "createCandidate.R", "propNeeded.R","createRace.R", "Race.R"), name="primaryRacePack")

#Create package
current.code <- as.package("primaryRacePack")