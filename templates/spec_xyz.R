#' @title Download, process and get information for the **xyz** dataset. 
#'
#' @param ... potential further arguments 
#' 
#' @return see details
#' 
#' @details 
#' ----- MODIFY BELOW -----
#' TODO: insert/edit dataset description
#' The xyz dataset only serves as a template for specification of new datasets.
#' ----- MODIFY ABOVE -----
#' 
#' \link{get_info}("xyz"): Return a list with properties of the processed dataset
#' and metadata of the data source.
#' 
#' \link{load_data}("xyz"): Load processed data into memory. 
#' If the data has not been processed before, also runs proc_data("xyz").
#'
#' \link{proc_data}("xyz"): Process the original data and save an rds file (for later use).
#' If the data has not been downloaded before, also runs get_data("xyz").
#' 
#' \link{get_data}("xyz"): Download the original data from the internet and save it locally.
#' 
#' The main reason the "_xyz" functions are exported, is to allow easy inspection of the source code. 
#' In practice, the use of the wrapper versions without suffix "_xyz"
#' is recommended, as shown in the examples. 
#' 
#' @references 
#' #' ----- MODIFY BELOW -----
#' TODO: insert references, e.g. data source and research papers
#' (1) Example Reference
#' The xyz dataset only serves as a template for specification of new datasets.
#' ----- MODIFY ABOVE -----
#' 
#' @seealso \link{get_info}, \link{get_data}, \link{proc_data}, \link{load_data}
#'
#' @examples
#' get_info("xyz") # get_info_xyz()
#' get_data("xyz") # get_data_xyz()
#' proc_data("xyz") # proc_data_xyz()
#' load_data("xyz") 
#' 
#' @name data_xyz
NULL
#> NULL


#' @rdname data_xyz
#' @export
get_info_xyz <- function(...){
  
  ## define dataset information:
  # ----- MODIFY BELOW -----
  # TODO: fill in/correct fields below
  define_info( 
    name = "xyz",
    properties = list(
      class = "data.frame", 
      length = 3,
      nrow = 3, 
      ncol = 4 
    ),
    metadata = list(
      repository = NA,
      url = NA
    )
  )
  # ----- MODIFY ABOVE -----
}


#' @rdname data_xyz
#' @importFrom readr read_csv
#' @export
proc_data_xyz <- function(...){
  
  ## process original data:
  # ----- MODIFY BELOW -----
  # TODO: insert code for data processing
  # TODO: save result to 'data' variable
  # TODO: add functions from other packages via @importFrom
  # TODO: add new parameters via @param
  # TODO: remove example below
  data <- readr::read_csv(get_path("xyz", "files", "data_xyz.csv"), show_col_types=FALSE)
  data$var2 <- data$var2*10
  data <- as.data.frame(data)
  # ----- MODIFY ABOVE -----
  
  ## save data (bundle) as RDS file:
  saveRDS(data, get_path("xyz", "data.rds"))
  
  ## no return value:
  return(invisible(NULL))
}


#' @rdname data_xyz
#' @importFrom readr write_csv
#' @export
get_data_xyz <- function(...){
  
  ## download and save original data:
  # ----- MODIFY BELOW -----
  # TODO: insert code for data download
  # TODO: add functions from other packages via @importFrom
  # TODO: add new parameters via @param
  # TODO: remove example below
  data <- data.frame(var1 = 1:4, var2=2:5, var3=letters[3:6])
  readr::write_csv(data, get_path("xyz", "files", "data_xyz.csv"))
  # ----- MODIFY ABOVE -----
  
  ## no return value:
  return(invisible(NULL))
}



