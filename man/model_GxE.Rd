% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_GxE.R
\name{model_GxE}
\alias{model_GxE}
\title{Run AMMI or GGE model}
\usage{
model_GxE(data, variable, gxe_analysis = NULL)
}
\arguments{
\item{data}{The data frame on which the model is run. It should come from \code{\link{format_data_PPBstats.data_agro}}}

\item{variable}{variable to analyse}

\item{gxe_analysis}{the analysis to carry out: "AMMI" or "GGE"}
}
\value{
The function returns a list with three elements :
\itemize{
 \item info : a list with variable and gxe_analysis
 \item ANOVA a list with five elements:
  \itemize{
   \item model
   \item anova_model
   \item germplasm_effects a list of two elements:
    \itemize{
     \item effects
     \item intra_variance
    }
   \item location_effects
   \item interaction_matrix
  }
 
 \item PCA : PCA object from FactoMineR
}
}
\description{
\code{model_GxE} runs AMMI or GGE model
}
\details{
scaling for interaction.matrix is not useful as the column mean is equal to 0 because of model constraints and all the values are regarding one variable, so it is possible to compare it into the PCA.

More information can be found in the book regarding \href{https://priviere.github.io/PPBstats_book/family-2.html#ammi}{AMMI} and \href{https://priviere.github.io/PPBstats_book/family-2.html#gge}{GGE}.
}
\seealso{
\itemize{
\item \code{\link{GxE_build_interaction_matrix}},
\item \code{\link{check_model}},
\item \code{\link{check_model.fit_model_GxE}}
}
}
\author{
Pierre Riviere
}
