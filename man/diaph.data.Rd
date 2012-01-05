\name{diaph.data}
\docType{data}
\alias{diaph.data}
\title{Diaphanography Partial Verification Bias Example}
\description{
This dataset consists of a list of imputed datasets
for an example of multiple imputation for 
the correction of partial verification bias, as originally reported in 
Harel and Zhou (2006) and discussed by deGroot, et al. (2008).}
\usage{diaph.data}
\format{ 
A list containing three elements:

imputed.tables:  A list of 100 imputed tables using the saturated categorical 
model of Schafer (1997).

sens.samples: A vector of 1000 draws of the sensitivity of the test from 
the posterior distribution using the saturated categorical model of Schafer (1997).

original.data: The original dataset from Marshall, et al. (1981), including the observations with missing gold standard values.
}
\source{Marshall, V., Williams, D.C., and Smith, K. D. (1981). Diaphanography as a means of
detecting breast cancer. \emph{Radiology} 150:339-343.}
\references{
Schafer, J. L. (1997). Analysis of Incomplete Multivariate Data by Simulation. Chapman & Hall Ltd. 

Harel O., Zhou X.H. (2006) Multiple imputation for correcting verification bias. \emph{Statistics in Medicine} 25:3769-3786. 

de Groot, J.A.H. and Janssen, K.J.M. and Zwinderman, A.H. and Moons, K.G.M. and Reitsma, J.B. (2008) Multiple imputation to correct for partial verification bias revisited. \emph{Statistics in Medicine} 27:5880-5899.
}
\details{
For the imputed tables and the original table, \code{D} refers to the gold standard test and \code{T} refers to the diagnostic test of interest. 
}
\examples{
data(diaph.data)
attach(diaph.data)
## Calculate sensitivity for each imputed table

sens.imps<-lapply(imputed.tables,function(x){ x[2,2]/(x[2,1]+x[2,2]) })
sens.imps.vars<-lapply(imputed.tables,function(x){ x[2,2]*x[2,1]/(x[2,1]+x[2,2])^3 })

### Calculate mixture summary

MImix(sens.imps,sens.imps.vars)

### Compare to usual t-summary using MIcombine: requires(mitools)

library(mitools)
summary(MIcombine(sens.imps,sens.imps.vars))

### Compare both to the Bayesian posterior estimate

quantile(sens.samples,c(0.025,0.5,0.975))

}

