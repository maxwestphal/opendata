#' Download an opendata dataset from the internet
#'
#' @param name character, name of the dataset
#' @param ... further arguments (passed to get_data_xyz for name="xyz")
#'
#' @return name (to allow piping)
#' @export
#'
#' @examples
#' get_data("ctg")
get_data <- function(name, ...){
  
  stopifnot(name %in% names(opendata::datasets))
  
  dir.create(get_path(name, "files"), recursive = TRUE, showWarnings = FALSE)
  
  do.call(paste0("get_data_", name), args = list(...))
  
  message(paste0("[opendata] '", name, "' data downloaded."))
  
  return(invisible(name))
}