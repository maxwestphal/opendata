#' Cleanup / delete opendata files
#'
#' @param name character, dataset name or NULL
#' @param dir character, opendata directory
#'
#' @return no return value
#' @export
#' 
#' @importFrom utils askYesNo
#' @examples
#' cleanup()
cleanup <- function(name, dir=get_dir()){
  
  ## case 1: missing name argument
  if(missing(name)){
    message("[opendata] Argument 'name' needs to be specified.")
    message("[opendata] -> name=NULL: delete entire opendata directory")
    message("[opendata] -> name='xyz': delete raw/processed data 'xyz'")
    message("[opendata] Nothing has been deleted.")
    return(invisible(NULL))
  }
    
  if(!(is.null(name) | is.character(name))){
    stop("name needs to be a character or NULL.")
  }  
  
  ## case 2: NULL name argument 
  if(is.null(name)){
    path <- dir
  }
  
  ## case 3: character name argument
  if(is.character(name)){
    stopifnot(name %in% names(opendata::datasets))
    path <- file.path(dir, name)
  }
  
  if(!dir.exists(path)){
    message(paste0("[opendata] There is no folder ", path))
    message("[opendata] Nothing has been deleted.")
    return(invisible(NULL))
  }
  
  ## user prompt for confirmation:
  query <- paste0("[opendata]\n The following folder and all contents are about to be deleted: ",
                  path, "\nDo you want to proceed?")
  answer <- utils::askYesNo(query, default = FALSE)
  
  ## delete data if confirmation was given:
  if(isTRUE(answer)){
    unlink(path, recursive = TRUE)
    message(paste0("[opendata] ", path, " has been deleted."))
  }else{
    message("[opendata] Deletion was not confirmed.")
    message("[opendata] Nothing has been deleted.")
  }
  
  return(invisible(NULL))
}