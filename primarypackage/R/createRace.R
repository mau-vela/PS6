#' Create an object of class 'Race'
#'
#' Function creates an object of class 'Race'
#'
#' @param name List of canidates of object class 'Candidate'
#' @param party Party 
#'
#' @return An object of class 'Race' containing
#' \itemize{
#' \item Candidates  of class 'Candidate'
#' \item party Party 
#' \item delegatesNeeded Number of delegates needed to win
#' \item delegatesRemaining Number of delegates remaining
#' }
#' @author Mauricio Vela
#' 
#' @examples
#' clinton <- createCandidate("Clinton", 1614, "Democrat")
#' sanders <- createCandidate("Sanders", 856, "Democrat")
#' Race <- createRace(Candidates = list(clinton, sanders), party = "Democrat")
#' plot(Race)
#' 
#' @rdname createRace
#' @aliases createRace,ANY-method
#' @export


#Generic
setGeneric(name = "createRace",
           def=function(Candidates, party)
           {standardGeneric("createRace")}
)

# create method to generate object of class Race
setMethod(f="createRace",
          definition=function(Candidates, party){
            # return object of class createRace
            return(new("Race", Candidates = Candidates, party = party))
          }
)