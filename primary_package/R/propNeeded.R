#' Proportion of delegates a given candidate needs to win nomination
#' 
#' Function that takes as arguments a candidate and the number of 
#' delegates remaining, and returns the proportion of delegates 
#' remaining needed for the candidate to win.
#'
#' @param object An object of class 'Candidate'.
#' @param remainingDelegates Number of remaining candidates
#' 
#' @return Proportion of the delegates not yet allocated that a given candidate needs to win party's nomination (numeric).
#' 
#' @author Mauricio Vela
#' @examples
#' 
#' Candidate <-createCandidate("Obama", 1000, "Democrat")
#' propNeeded(Candidate, 3000) 
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#' @rdname propNeeded
#' @aliases propNeeded,ANY-method
#' @export


# create generic function that executes method 
setGeneric(name = "propNeeded",
  def = function(object, remainingDelegates=NULL){
  if(!is.numeric(remainingDelegates))  stop("remainingDelegates must be numeric")
  standardGeneric("propNeeded")
  }
)

# create new method propNeeded
setMethod(f="propNeeded", definition = function(object, remainingDelegates){
  #Proportion of delegates needed
  delegateProp <- (object@delegatesNeeded - object@delegatesWon) / remainingDelegates
  #Proportion cannot be greater than one
  if(delegateProp > 1) stop("The candidate already lost or the number of delegates remaining should be higher")
  return(delegateProp)
  }
)