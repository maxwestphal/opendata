#' Get information for a dataset
#'
#' @param name character, name of the dataset
#' 
#' @details get_info("xyz") is analogous to get_info_xyz()
#'
#' @return a list of properties and metadata
#' @export
#'
#' @examples
#' get_info("ctg")
get_info <- function(name){
  stopifnot(is.character(name))
  if(name == ""){return(NULL)}

  do.call(paste0("get_info_", name), args=list())
}