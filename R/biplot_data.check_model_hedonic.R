#' Format data for CA biplot
#'
#' @description
#' \code{biplot_data.check_model_hedonic} format data for CA plot from \code{\link{check_model.fit_model_hedonic}}
#' 
#' @param x Output from \code{\link{check_model.fit_model_hedonic}}
#' 
#' @return 
#' The function return a list with two object : CA and HCPC objects
#'  
#' @details 
#' S3 method.
#'  
#' @author Pierre Riviere
#'
#' @seealso 
#' \itemize{
#' \item \code{\link{biplot_data}}
#' \item \code{\link{check_model.fit_model_hedonic}}
#' \item \code{\link{plot.biplot_hedonic}}
#' }
#'
#' @export
#' 
biplot_data.check_model_hedonic = function(x){
  if( !inherits(x, "check_model_hedonic") ) {
    stop("data must come from PPBstats::check_model() with output from PPBstats:model_hedonic.")
  }
  out = list("CA" = x$hedonic$CA, "HCPC" = x$hedonic$HCPC)
  class(out) <- c("PPBstats", "biplot_hedonic")
  return(out)
}

