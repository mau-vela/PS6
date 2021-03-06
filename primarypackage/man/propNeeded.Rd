% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/propNeeded.R
\name{propNeeded}
\alias{propNeeded}
\alias{propNeeded,ANY-method}
\title{Proportion of delegates a given candidate needs to win nomination}
\usage{
propNeeded(object, remainingDelegates = NULL)
}
\arguments{
\item{object}{An object of class 'Candidate'.}

\item{remainingDelegates}{Number of remaining candidates}
}
\value{
Proportion of the delegates not yet allocated that a given candidate needs to win party's nomination (numeric).
}
\description{
Function that takes as arguments a candidate and the number of 
delegates remaining, and returns the proportion of delegates 
remaining needed for the candidate to win.
}
\examples{

Candidate <-createCandidate("Obama", 1000, "Democrat")
propNeeded(Candidate, 3000) 

}
\author{
Mauricio Vela
}
\seealso{
\code{\link{createCandidate}}, \code{\link{Candidate}}
}

