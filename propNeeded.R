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
#' newCandidate <- createCandidate("John Kasich", 143, "Republican")
#' propNeeded(newCandidate)
#' propNeeded(newCandidate, 1396) 
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#' @rdname propNeeded
#' @aliases propNeeded,ANY-method
#' @export
# create generic function that executes method 
setGeneric(name = "propNeeded",
           # set default remaining delegates as of March, 17 (1396)
           def = function(object, remainingDelegates=NULL){
             # check validity
             validObject(object)
             # make sure remaining is entered correctly
             if(is.null(remainingDelegates)){
               stop("Please indicate how many delegates remain!")
             }
             if(!is.numeric(remainingDelegates)){
               stop("remainingDelegates must be numeric!")
             }
             standardGeneric("propNeeded")
           }
)

# create new method propNeeded
setMethod(f="propNeeded", 
          # create function
          definition = function(object, remainingDelegates){
            # calculate proportion of remaining delegates needed to win
            delegateProp <- ((object@delegatesNeeded - object@delegatesWon) / remainingDelegates)
            # make sure candidate is not essentially eliminated already
            ifelse(delegateProp > 1, stop("The number of delegates needed exceeds the number available."),
                   return(delegateProp)
            )
          }
)