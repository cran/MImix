\name{MImix}
\alias{MImix}
\alias{MImix.default}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Multiple imputation summaries via mixture of normals}
\description{
Combines results of analyses on multiply imputed data sets using a mixture of normal distributions.
}
\usage{
MImix(results, ...)
\method{MImix}{default}(results,variances,weights = 1/length(results), percentiles = c(0.025, 0.5, 0.975), ...) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{results}{A list of results from inference on separate imputed datasets}
  \item{variances}{If \code{results} is a list of parameter vectors,
    \code{variances} should be the corresponding variance-covariance
    matrices}
  \item{weights}{A vector of weights for each imputed dataset. The default is to use equal weights.}
  \item{percentiles}{A vector of percentiles to be returned from the mixture summary distribution. The default is to return the 2.5th, 50th, and 97.5th percentiles.}
  \item{\dots}{Other arguments, not used}
}
\details{
This function combines results of analyses on multiply imputed data sets using a mixture of normal distributions according
to the approach described in Steele, R.J., Wang, N., and Raftery A.E. (2009).  This package contains a generic
function default method, although other methods may be available in future releases.   The 
\code{results} argument in the default method may be either a list of
parameter vectors or a list of objects that have \code{coef} and
\code{vcov} methods.  In the former case a list of variance-covariance
matrices must be supplied as the second argument. This corresponds to the same 
structure that is used by \code{MIcombine} in the \code{mitools} package. 
}
\value{
  An list containing the desired percentiles from the mixture summary distribution.
}
\references{ Steele, R.J., Wang N., and Raftery, A.E. (2009) Inference from Multiple Imputation for Missing Data 
Using Mixtures of Normals \emph{Sociological Methodology} Accepted. }
\author{Russell Steele, \email{steele@math.mcgill.ca}}
\examples{
### See help(diaph.data) for example

}
\keyword{htest}% at least one, from doc/KEYWORDS
\keyword{manip}% at least one, from doc/KEYWORDS
\keyword{surveys}% __ONLY ONE__ keyword per line