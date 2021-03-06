% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.mean_comparisons_model_hedonic.R
\name{plot.mean_comparisons_model_hedonic}
\alias{plot.mean_comparisons_model_hedonic}
\title{Get ggplot to visualize output from \code{\link{mean_comparisons.check_model_GxE}}}
\usage{
\method{plot}{mean_comparisons_model_hedonic}(x, nb_parameters_per_plot = 8,
  ...)
}
\arguments{
\item{x}{Output from \code{\link{mean_comparisons.check_model_hedonic}}}

\item{nb_parameters_per_plot}{number of parameter per plot to display}

\item{...}{further arguments passed to or from other methods}
}
\value{
A list with barplot.
For each element of the list, there are as many graph as needed with \code{nb_parameters_per_plot} parameters per graph.
Letters are displayed on each bar. Parameters that do not share the same letters are different regarding type I error (alpha) and alpha correction. 
The error I (alpha) and the alpha correction are displayed in the title. 
\itemize{
 \item germplasm : mean comparison for germplasm
 }
}
\description{
\code{plot.mean_comparisons_model_hedonic} returns ggplot to visualize outputs from \code{\link{mean_comparisons.check_model_hedonic}}
}
\details{
S3 method.
See example in the book: https://priviere.github.io/PPBstats_book/hedonic.html#get-and-visualize-mean-comparisons-6
}
\seealso{
\code{\link{mean_comparisons.check_model_hedonic}}
}
\author{
Pierre Riviere
}
