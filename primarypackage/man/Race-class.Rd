\name{Race-class}
\Rdversion{1.1}
\docType{class}
\alias{Race-class}
\alias{initialize,Race-method}
\alias{plot,Race-method}

\title{Class \code{"Race"}}
\description{
%%  ~~ A concise (1-5 lines) description of what the class is. ~~
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("Race", Candidates, party)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{Candidates}:}{Object of class \code{"list"} ~~ }
    \item{\code{party}:}{Object of class \code{"character"} ~~ }
    \item{\code{delegatesNeeded}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{delegatesRemaining}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{initialize}{\code{signature(.Object = "Race")}: ... }
    \item{plot}{\code{signature(x = "Race")}: ... }
	 }
}
\references{
%%  ~~put references to the literature/web site here~~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("Race")
}
\keyword{classes}
