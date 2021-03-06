% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_data_PPBstats.data_agro.R
\name{format_data_PPBstats.data_agro}
\alias{format_data_PPBstats.data_agro}
\title{Check and format the data to be used by PPBstats functions for data version in agronomic analyses}
\usage{
format_data_PPBstats.data_agro(data)
}
\arguments{
\item{data}{The data frame to format.
It should have at least the following columns : c("year", "germplasm", "location", "block", "X", "Y", "..."), with "..." the variables.
The variables can be linked to their corresponding dates. 
The dates are associated to their corresponding variable by $.
For example the date associated to variable y1 is y1$date.
The date must have format year-month-day, e.g. 2017-12-05}
}
\description{
\code{format_data_PPBstats.data_agro} checks and formats the data to be used by PPBstats functions for data version in agronomic analyses
}
\details{
See the book for more details \href{https://priviere.github.io/PPBstats_book/intro-agro.html#data-agro}{here}.
}
\seealso{
\code{\link{format_data_PPBstats}}
}
\author{
Pierre Riviere
}
