library(devtools)
library(roxygen2)
setwd("C:/Users/MauricioAndresVela/Documents/R/Clase/PS6")

#package.skeleton(code_files = c("primarypackage-package.R", "Candidate.R", "createCandidate.R", "propNeeded.R","createRace.R", "Race.R"), name="primarypackage")

devtools::create("primarypackage")

#Create package
current.code <- as.package("primarypackage")

load_all(current.code)
document(current.code)

#check(current.code)

#INstall package
install(pkg=current.code, local=TRUE)
build(current.code, path=getwd()) 




#Example
library(primarypackage)
clinton <- createCandidate("Clinton", 1614, "Democrat")
sanders <- createCandidate("Sanders", 856, "Democrat")
Race <- createRace(Candidates = list(clinton, sanders), party = "Democrat")
plot(Race)