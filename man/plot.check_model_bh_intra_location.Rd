% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.check_model_bh_intra_location.R
\name{plot.check_model_bh_intra_location}
\alias{plot.check_model_bh_intra_location}
\title{Get ggplot to visualize output from \code{\link{check_model.fit_model_bh_intra_location}}}
\usage{
\method{plot}{check_model_bh_intra_location}(x, nb_parameters_per_plot = 8,
  ...)
}
\arguments{
\item{x}{Output from \code{\link{check_model.fit_model_bh_intra_location}}}

\item{nb_parameters_per_plot}{number of parameter per plot to display}

\item{...}{further arguments passed to or from other methods}
}
\value{
\itemize{
 \item sigma_j_gamma : mean of each sigma_j displayed on the inverse Gamma distribution. 
 The first graph represent all the sigma_j, the other graph represent \code{nb_parameters_per_plot} sigma_j per graph.
 \item mu_ij : distribution of each mu_ij in a list with as many elements as environment. 
 For each element of the list, there are as many graph as needed with \code{nb_parameters_per_plot} mu_ij per graph.
 \item beta_jk : distribution of each beta_jk in a list with as many elements as environment. 
 For each element of the list, there are as many graph as needed with \code{nb_parameters_per_plot} beta_jk per graph.
 \item sigma_j : distribution of each sigma_j. 
 There are as many graph as needed with \code{nb_parameters_per_plot} sigma_j per graph.
 \item epsilon_ijk : standardised residuals distribution.
 If the model went well it should be between -2 and 2.
 \item mcmc_not_converge_traceplot_density : a list with the plots of trace and density to check the convergence of the two MCMC only for chains that are not converging thanks to the Gelman-Rubin test. 
 If all the chains converge, it is NULL.
 }
}
\description{
\code{plot.check_model_bh_GxE} returns ggplot to visualize outputs from \code{\link{check_model.fit_model_bh_intra_location}}
}
\details{
S3 method.

See example in the book: https://priviere.github.io/PPBstats_book/family-2.html#model-1

For mcmc_not_converge_traceplot_density : If you wish exhaustive information, look at \code{ggmcmc::ggmcmc} with \code{ggmcmc(out_model$MCMC)}. 
But be careful with the size of your MCMC output which are often too big to be performed in R.
}
\seealso{
\code{\link{check_model.fit_model_bh_intra_location}}
}
\author{
Pierre Riviere
}
