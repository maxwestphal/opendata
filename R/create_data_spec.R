#' Specify a new dataset
#'
#' @details This function is not exported, but only used in development. 
#' Use via opendata:::specify_data() or by utilizing devtools::load_all().
#'
#' @param name character, name of the new dataset
#'
#' @return no return value
#'
#' @importFrom fs file_copy
#' @importFrom xfun gsub_file
#' @importFrom usethis edit_file
#'
#' @examples
#' # opendata:::create_data_spec("abc")
create_data_spec <- function(name){
  
  stopifnot(length(name) == 1)
  stopifnot(is.character(name))
  stopifnot(nchar(name) > 1)
  
  ## create file / copy template:
  newfile <- paste0("./R/spec_", name, ".R")
  fs::file_copy("./templates/spec_xyz.R", newfile)
  
  ## modify new file:
  xfun::gsub_file(newfile, pattern = "xyz", replacement = name, fixed=TRUE)
  
  ## add new dataset to specs.R:
  xfun::gsub_file("./R/specs.R", pattern = '""$', replacement = paste0('"', name, '",\n\t""'))
  
  ## Open the file in RStudio to edit it:
  usethis::edit_file(newfile)
}