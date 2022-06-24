#' Load an opendata dataset
#'
#' @param name character
#' @param keep_files logical
#' @param keep_rds logical
#'
#' @return data in suitable format
#' @export
#'
#' @examples
#' load_data("ctg")
load_data <- function(name, keep_files=TRUE, keep_rds=TRUE){
  
  stopifnot(name %in% names(opendata::datasets))
  
  path <- get_path(name)
  file <- get_path(name, "data.rds")
  
  ## if file does not yet exist, create it first:
  if(!file.exists(file)){
    proc_data(name=name, keep_files=keep_files)
  }
  
  ## read in processed data:
  data <- readRDS(file)
  
  ## delete files if required:
  if(!keep_files){unlink(path, recursive = TRUE)}
  
  ## delete rds file if required:
  if(!keep_rds){file.remove(file)}
  
  message(paste0("[opendata] '", name, "' data loaded."))
  
  return(data)
}