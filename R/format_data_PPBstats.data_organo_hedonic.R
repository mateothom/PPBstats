#' Check and format the data to be used by PPBstats functions for hedonic analyses
#'
#' @description
#' \code{format_data_PPBstats.data_organo_hedonic} checks and formats the data to be used by PPBstats functions for hedonic analyses
#' 
#' @param data The data frame with the following columns : sample, juges, note, descriptors, germplasm, location. 
#' The descriptors must be separated by ";". Any other column can be added as supplementary variables.
#' 
#' @param threshold number of occurence of descriptors <= threshold are kept
#' 
#' @details
#' See the book for more details \href{https://priviere.github.io/PPBstats_book/hedonic.html#format-the-data-8}{here}.
#' 
#' @return 
#' It returns a list of four elements
#' \itemize{
#'  \item data the data formated to run the anova and the multivariate analysis regarding
#'  \itemize{
#'   \item sample
#'   \item juges
#'  }
#'  \item var_sup the supplementary variables used in the multivariate analysis
#'  \item descriptors the vector of descriptors cited knowing the threshold applyed when formated the data.
#' }
#' 
#' @author Pierre Riviere
#' 
#' @seealso \code{\link{format_data_PPBstats}}
#' 
#' @import plyr
#' 
#' @export
#' 
format_data_PPBstats.data_organo_hedonic = function(data, threshold){

  mess = "In data, the following column are compulsory : \"sample\", \"germplasm\", \"location\", \"juges\", \"note\", \"descriptors\"."
  if(!is.element("sample", colnames(data))) { stop(mess) }
  if(!is.element("germplasm", colnames(data))) { stop(mess) }
  if(!is.element("location", colnames(data))) { stop(mess) }
  if(!is.element("juges", colnames(data))) { stop(mess) }
  if(!is.element("note", colnames(data))) { stop(mess) }
  if(!is.element("descriptors", colnames(data))) { stop(mess) }
  
  if(!is.factor(data$sample)) { stop("sample must be factor") }
  if(!is.factor(data$germplasm)) { stop("germplasm must be factor") }
  if(!is.factor(data$location)) { stop("location must be factor") }
  if(!is.factor(data$juges)) { stop("juges must be factor") }
  if(!is.numeric(data$note)) { stop("note must be numeric") }
  if(!is.factor(data$descriptors)) { stop("descriptors must be factor") }
  
  # germplasm and location at the end as supplementary variables
  #data_tmp = data[,is.element(colnames(data), c("germplasm", "location"))]
  #data_tmp = cbind.data.frame(data_tmp, data[,c("germplasm", "location")])
  
  # check if there are only one obvervation per germplasm and location per juges
  data_tmp = data
  data_tmp$row = c(1:nrow(data_tmp))
  data_tmp$id = paste("sample", data_tmp$sample, "by juge", data_tmp$juges, "on row", data_tmp$row)
  data_per_juges = plyr:::splitter_d(data_tmp, .(juges))
  data_per_juges_ok = lapply(data_per_juges, function(x){
    x$gl = paste(x$germplasm, x$location)
    dup = duplicated(x$gl)
    id = x$id[dup]
    x = x[!dup,]
    return(list(id, x))
  })
  
  id_not_kept = unlist(lapply(data_per_juges_ok, function(x){ x[[1]] }))
  if( length(id_not_kept) > 0 ) {
    warning("The following samples are not kept because they have been already tasted (i.e. germplasm and location combinaison already exist):\n", 
            paste(id_not_kept, collapse = ",\n"))
  }
  
  data_ok = do.call("rbind", lapply(data_per_juges_ok, function(x){ x[[2]] }))
  data_ok = data_ok[,!is.element(colnames(data_ok), c("row", "id", "gl"))]
  rownames(data_ok) = c(1:nrow(data_ok))
  
  # remove row with no descriptor
  remove_row_with_no_descriptors = which(data_ok$descriptors == "")
  if( length(remove_row_with_no_descriptors) > 0 ) { 
    data_ok = data_ok[-remove_row_with_no_descriptors,]
    warning("The following row in data have been remove because there are no descriptors :", paste(remove_row_with_no_descriptors, collapse = ", "))
  }
  
  var_sup = colnames(data_ok)[!is.element(colnames(data_ok), c("sample", "juges", "note", "descriptors"))]
  d = format_organo(data_ok, threshold, var_sup)
  
  descriptors = colnames(d$data_sample)[!is.element(colnames(d$data_sample), c("sample", "juges", "note", var_sup))]
  
  d = list("data" = d, 
           "var_sup" = var_sup,
           "descriptors" = descriptors
           )
  
  class(d) <- c("PPBstats", "data_organo_hedonic")
  message(substitute(data), " has been formated for PPBstats functions.")
  return(d)
}

  
  
