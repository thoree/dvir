% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/findUndisputed.R
\name{findUndisputed}
\alias{findUndisputed}
\title{Undisputed identifications in DVI problems}
\usage{
findUndisputed(
  pm,
  am,
  missing,
  pairings = NULL,
  threshold = 10000,
  relax = FALSE,
  limit = 0,
  check = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{pm}{PM data: List of singletons.}

\item{am}{AM data: A \code{ped} object or list of such.}

\item{missing}{Character vector with names of the missing persons.}

\item{pairings}{A list of possible pairings for each victim. If NULL, all
sex-consistent pairings are used.}

\item{threshold}{A non-negative number. If no pairwise LR exceed this, the
iteration stops.}

\item{relax}{A logical affecting the definition of being undisputed (see
Details). Default: FALSE.}

\item{limit}{A positive number. Only pairwise LR values above this are
considered.}

\item{check}{A logical indicating if the input data should be checked for
consistency. Default: TRUE.}

\item{verbose}{A logical. Default: TRUE.}
}
\value{
A list with the following entries:
\itemize{
\item \code{undisputed}: A list of undisputed matches and the corresponding LR
values.
\item \code{pmReduced}: Same as \code{pm}, but with the undisputed victims removed.
\item \code{amReduced}: Same as \code{am}, but with the data from undisputed victims
inserted for the corresponding missing persons.
\item \code{missingReduced}: Same as \code{missing}, but without the undisputed
identified missing persons.
\item \code{LRmatrix}, \code{LRlist}, \code{pairings}: Output from \code{pairwiseLR()} applied to
the reduced problem.
}
}
\description{
This function uses the pairwise LR matrix to find "undisputed" matches
between victims and missing individuals. An identification \eqn{V_i = M_j} is
called undisputed if the corresponding likelihood ratio \eqn{LR_{i,j}}
exceeds the given \code{threshold}, while all other pairwise LRs involving
\eqn{V_i} or \eqn{M_j} are at most 1.
}
\details{
If the parameter \code{relax} is set to TRUE, the last criterion is relaxed,
requiring instead that \eqn{LR_{i,j}} is at least \code{threshold} times greater
than all other pairwise LRs involving \eqn{V_i} or \eqn{M_j}
}
\examples{

pm = planecrash$pm
am = planecrash$am
missing = planecrash$missing

findUndisputed(pm, am, missing, threshold = 1e4)

# With `relax = TRUE`, one more identification is undisputed
findUndisputed(pm, am, missing, threshold = 1e4, relax = TRUE)

}
\seealso{
\code{\link[=pairwiseLR]{pairwiseLR()}}
}
