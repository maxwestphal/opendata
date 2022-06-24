#' Process an opendata dataset
#'
#' @param name character, name of opendata dataset
#' @param ... further arguments (passed to proc_data_xyz for name="xyz")
#' @param keep_files logical, should the original files be kept? (default: TRUE)
#'
#' @return no return value
#' @export
proc_data <- function(name, ..., keep_files=TRUE){
  
  stopifnot(name %in% names(opendata::datasets))
  
  path_files <- get_path(name, "files")
  
  ## if path does not exist, get / download data first:
  if(!dir.exists(path_files)){
    get_data(name=name, dir=dir)
  }
  
  ## process data:
  do.call(paste0("proc_data_", name), args = list(...))
  
  ## delete files if required:
  if(!keep_files){unlink(path_files, recursive = TRUE)}
  
  message(paste0("[opendata] '", name, "' data processed."))
  
  return(invisible(name))
  
}