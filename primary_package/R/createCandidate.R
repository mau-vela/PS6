#' Create an object of class 'Candidate'
#' Function that creates an object of class `Candidate'
#'
#' @param name Name of the presidential candidate
#' @param party Democrat or Republican  
#' @param delegatesWon Number of delegates won by given candidate
#'
#' @return An object of class `Candidate' containing
#' \itemize{
#' \item name Name of the presidential candidate
#' \item party Party 
#' \item delegatesWon Delegates won
#' \item{delegatesNeeded} Number of delegates needed to obtain a nomination
#'  }
#' @author Mauricio Vela
#' @examples
#' 
#' Candidate <-createCandidate("Obama", 100, "Democratic") 
#' 
#' @seealso \code{\link{PropNeeded}}, \code{\link{createRace}}
#' @rdname createCandidate
#' @aliases createCandidate,ANY-method
#' @export


# create generic for method for createCandidate
setGeneric(name = "createCandidate",
           def=function(name, delegatesWon, party)
           {standardGeneric("createCandidate")}
)

# create method to generate object of class Candidate
setMethod(f="createCandidate",
          definition=function(name, delegatesWon, party){
            # return object of class Candidate
            return(new("Candidate", name = name, delegatesWon = delegatesWon, party = party))
          }
)