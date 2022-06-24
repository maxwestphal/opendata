define_info <- function(name, properties, metadata){
  
  stopifnot(is.character(name))
  stopifnot(is.list(properties))
  stopifnot(is.list(metadata))
  
  info <- list(
    list(
      properties = properties,
      metadata = metadata
    ) 
  )
  names(info) <- name
  
  return(info)
}