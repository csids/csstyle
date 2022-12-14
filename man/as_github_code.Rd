% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/github_code.R
\name{as_github_code}
\alias{as_github_code}
\title{An easy way to print github code}
\usage{
as_github_code(url)
}
\arguments{
\item{url}{URL from github}
}
\description{
An easy way to print github code
}
\examples{
x <- as_github_code("https://raw.githubusercontent.com/folkehelseinstituttet/scskeleton/main/R/00_env_and_namespace.r")
x <- as_github_code("https://github.com/folkehelseinstituttet/scskeleton/blob/main/R/00_env_and_namespace.r")
print(x, lines = 3:5)
}
