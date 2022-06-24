#' Get the opendata directory for the current project
#'
#' @return returns the data directory as a character, the default 
#' is "./data" (if not set before via \link{set_dir})  
#' @export
#' @importFrom yaml read_yaml
#'
#' @examples
#' get_dir()
get_dir <- function(){
  dir <- "~/R/opendata" # TODO: ok?
  if(file.exists("config.yml")){
    config <- yaml::read_yaml("config.yml")
    dir <- config$opendata$dir
  }
  # if(!dir.exists(dir)){dir.create(dir, recursive = TRUE)} # TODO: needed?
  return(dir)
}

#' Set the opendata directory for the current project
#'
#' @param dir character, specification of directory, the default is "~/R/opendata"
#' (within the current working directory)
#'
#' @details the directory is saved in the config.yml file created 
#' in the current working directory
#' @return NULL
#' @export
#'
#' @importFrom yaml read_yaml
#' @importFrom yaml write_yaml
#' @examples
#' # get_dir()
#' # set_dir("~/R/opendata")
#' # get_dir()
set_dir <- function(dir = "~/R/opendata"){ # TODO: ok? # "./data/opendata" 
  if(file.exists("config.yml")){
    config <- yaml::read_yaml("config.yml")
    config$opendata$dir <- dir
  }else{
    config <- list(opendata = list(dir = dir))
  }
  yaml::write_yaml(config, "config.yml")
}

#' Delete the opendata config file
#'
#' @return no return value
#' @export
#'
#' @examples
#' delete_config_file()
delete_config_file <- function(){
  file.remove("config.yml")
  return(invisible())
}






