\name{SkiMack}
\alias{SkiMack}
\title{The Skillings-Mack test statistic}
\description{
The Skillings-Mack test statistic is a generalization of the statistic used in Friedman's ANOVA method and in Durbin's rank test. This nonparametric statistical test is useful for the data obtained from block designs with missing observations occurring randomly. The results from the SkiMack function are the Skillings-Mack statistic, p-values based on the chi-squared distribution and Monte Carlo method. The Monte Carlo method is recommended for approximating p-values when there are many ties and/or small designs with missing values are conducted.
}
\arguments{
  \item{y}{Either a numeric vector of data values, or a data matrix. If a matrix is used, columns and rows are correspondent to blocks and treatments (groups), respectively.}
  \item{groups}{A vector giving the group (treatment) for the corresponding elements of y if this is a vector; ignored if y is a matrix. Either a numeric or character vector is accepted.}
  \item{blocks}{A vector giving the block for the corresponding elements of y if this is a vector; ignored if y is a matrix. Either a numeric or character vector is accepted.}
  \item{simulate.p.value}{If TRUE, an estimated p-value based on the Monte Carlo approach is calculated. The default is FALSE.}
  \item{B}{If simulate.p.value = TRUE, the default number of replications is 10,000.}
  \item{suppress}{If TRUE, this will hide the data view in the output. The default is FALSE.}}
\details{
This function implements the Skilling-Mack test statistic for data obtained from block designs with missing observations. The skillings.mack function
can also applied to balanced and partially balanced incomplete block designs. It reads a dataset from a vector or a matrix and returns a p-value based on the chi-squared distribution. If simulate.p.value = TRUE, an estimated p-value based on Monte Carlo will be provided. If there are ties in a particular block, the average rank for those will be generated in simulating data under the null hypothesis.}
\value{
   \item{$Nblocks}{the number of blocks in a design}
   \item{$Ntreatments}{the number of groups (treatments) in a design}
   \item{$rawdata}{a matrix containing the data that was read from y}
   \item{$rankdata}{a matrix containing ranks of the data}
   \item{$varCovarMatrix}{the variance-covariance matrix for adjusted treatment sums}
   \item{$adjustedSum}{the adjusted treatment sum,Aj, for the jth treatment}
   \item{$pValue}{the calculated p-value for the test}
   \item{$pValueSim}{the simulated p-value when simulate.p.value = TRUE}
}
\references{
Skillings, J.H., Mack, G.A.: On the Use of a Friedman-Type Statistic in Balanced and Unbalanced Block Designs. Technometrics 23(2), 171-177 (1981)
}
\author{
Patchanok Srisuradetchai <s.patchanok@gmail.com>\cr
John J. Borkowski <jobo@math.montana.edu>
}
\examples{
## Skilling and Mack (1981), Table 1 page 173
## Comparison of four methods of assembling a product
B <- rep(c(1,2,3,4,5,6,7,8,9),rep(4,9))
G <- rep(c('A','B','C','D'),9)
y <- c(3.2,4.1,3.8,4.2,    3.1,3.9,3.4,4.0,	 4.3,3.5,4.6,4.8, 
       3.5,3.6,3.9,4.0,   3.6,4.2,3.7,3.9,   4.5,4.7,3.7, NA,
	     NA ,4.2,3.4,NA ,   4.3,4.6,4.4,4.9,   3.5, NA,3.7, 3.9)
SkiMack(y,groups = G,blocks = B)

## y is a matrix
maty <- matrix(
   c(3.2,4.1,3.8,4.2,		3.1,3.9,3.4,4.0,	 4.3,3.5,4.6,4.8, 
     3.5,3.6,3.9,4.0,   3.6,4.2,3.7,3.9,   4.5,4.7,3.7, NA,
	   NA ,4.2,3.4,NA ,   4.3,4.6,4.4,4.9,   3.5, NA,3.7, 3.9),
    ncol=9,byrow=FALSE)
SkiMack(maty, simulate.p.value = TRUE, B = 1000)
}
\keyword{Skilling-Mack, missing values}

