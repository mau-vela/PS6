#' A Candidate object 
#' 
#' Object of class \code{Candidate} are created by the \code{CreateCandidate} functionsn. Objects of
#' this class include \code{show} and \code{print} methods.
#' 
#' An object of the class `Candidate' has the following slots:
#' \itemize{
#' \item \code{name} The name of the candidate
#' \item \code{Party} The name of the party
#' \item \code{delegatesWon} Number of delegates won
#' \item \code{delegatesNeeded} Number of delegates needed to win nomination
#' }
#'
#' @author Mauricio Vela
#' @aliases Candidate-class initialize,Candidate-method show,Candidate-method
#' @rdname Candidate-class
#' @export


#Class candidate
setClass(Class="Candidate",
         slots = c(name = "character",
                   party = "character",
                   delegatesWon = "numeric",
                   delegatesNeeded = "numeric"
         ),
         prototype = prototype(
           name = NULL,
           party = NULL,           
           delegatesWon = numeric(),
           delegatesNeeded = numeric()
         ),
         #Need to make sure the party is democratic or republican to identify number of delegates
         validity = function(object){
           if(object@party != "Republican" & object@party != "Democrat"){
             stop("Party have to be Republican or Democrat")
           }
         }         
)

#' @export

#Set method
setMethod("initialize", "Candidate", 
          function(.Object, name, party, delegatesWon){
            # assign .Object attributes to variables
            .Object@name <- name
            .Object@party <- party
            .Object@delegatesWon <- delegatesWon
            #Delegates needed according to the party 
            if(party=="Republican"){
              .Object@delegatesNeeded <- 1237
            }
            if(party=="Democrat"){
              .Object@delegatesNeeded <- 2383
            }
            value=callNextMethod()
            return(value)
          }
)

#' @export

#Show function 
setMethod("show", "Candidate",
  function(object){
    cat(paste0("Name of the candiate: ", object@name, "\n Party: ", object@party,
               "\n Delegates Won: ", object@delegatesWon, "\n Delegates needed: ", object@delegatesNeeded))
    if(class(object)=="Remaining")  cat(paste0("\n remain_prop':\n", object@remain_prop))
})
