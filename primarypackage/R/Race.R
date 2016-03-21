#' A Race object 
#' Objects of class \code{Race} are created by the \code{createRace} function. 
#' 
#' An object of the class `Race' has the following slots:
#' \itemize{
#' \item \code{Candidates} Objects of class 'Candidate' from the same party
#' \item \code{party} Party 
#' \item \code{delegatesNeeded} Number of delegates needed
#' \item \code{delegatesRemaining} Number of delegates remaining
#' }
#' 
#' @examples
#' clinton <- createCandidate("Clinton", 1614, "Democrat")
#' sanders <- createCandidate("Sanders", 856, "Democrat")
#' Race <- createRace(Candidates = list(clinton, sanders), party = "Democrat")
#' plot(Race)
#' 
#' @seealso  \code{\link{createRace}}
#' @author Mauricio Vela
#' @aliases Race-class initialize,Race-method plot,Race-method 
#' @rdname Race
#' @export


#Class Race object
setClass(Class="Race", slots = 
           c(Candidates = "list", 
            party = "character", 
           delegatesNeeded = "numeric",
           delegatesRemaining = "numeric"
         ),
         prototype = prototype(
           Candidates = NULL,
           party = NULL,
           delegatesNeeded = numeric(),
           delegatesRemaining = numeric()
         ),
         #Party should be Democrat or Republican, and all from the same party
         validity = function(object){
           if(object@party != "Republican" & object@party != "Democrat"){
             stop("Only Republican or Democrat")
           }
           if(length(unique(sapply(object@Candidates, function(x){x@party})))!=1){
             stop("All candidates most be from the same party")
           }
         }
)
#' @export
#Create method
setMethod("initialize", "Race", function(.Object, Candidates, party){
            .Object@Candidates <- Candidates
            .Object@party <- party
            if(.Object@party=="Republican"){
              totalWon <- sum(sapply(.Object@Candidates, function(x) x@delegatesWon))
              .Object@delegatesRemaining <- 2472 - totalWon
              if (.Object@delegatesRemaining<0) stop("The delegates sum is incorrect")
              .Object@delegatesNeeded <- 1237
            }
            if(.Object@party=="Democrat"){
              totalWon <- sum(sapply(.Object@Candidates, function(x) x@delegatesWon))
              .Object@delegatesRemaining <- 4765 - totalWon
              if (.Object@delegatesRemaining<0) stop("The delegates sum is incorrect")
              .Object@delegatesNeeded <- 2383
            }
            value=callNextMethod()
            return(value)
          }
) 
#' @export


#Plot method
setMethod(f="plot", signature="Race", definition=function(x=NULL, y=x, ...){
            #Vector of Delegates won by each candidates
            delegatesWon <- sapply(x@Candidates, function(z) z@delegatesWon)
            # create delegates needed to win for each candidate
            delegatesNeeded <-x@delegatesNeeded 
            # Names of the candidates
            names <- sapply(x@Candidates, function(z) z@name)
            #Color according to the party
            if(x@party == "Democrat") color <- "blue"
            if(x@party == "Republican") color <- "red"
            #Create barplot
            xx <- barplot(delegatesWon, beside=T,
                    main=paste0("Delegates for ", x@party, "primaries"), 
                    ylab="Number of Delegates", xlab = "Candidates",
                    names.arg=names, 
                    ylim=c(0, x@delegatesNeeded + 200), col = color)
            text(x = xx, y = delegatesWon, label = delegatesWon, pos = 3, cex = 0.8, col = "black")
            abline(h = delegatesNeeded, lty = 3)
          }
)