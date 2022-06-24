#' @title Download, process and get information for the **wdbc** dataset. 
#'
#' @param ... potential further arguments 
#' 
#' @return see details
#' 
#' @details 
#' "Features are computed from a digitized image of a fine needle aspirate (FNA) of a breast mass.
#' They describe characteristics of the cell nuclei present in the image. A few of the images can
#' be found at <http://www.cs.wisc.edu/~street/images/>.
#' Separating plane described above was obtained using Multisurface Method-Tree (MSM-T)\eqn{^2},
#' a classification method which uses linear programming to construct a decision tree.
#' Relevant features were selected using an exhaustive search in the space of 1-4 features
#' and 1-3 separating planes.
#' The actual linear program used to obtain the separating plane in the 3-dimensional space is
#' that described in: Bennett and Mangasarian (1992)\eqn{^3}." \eqn{^1}
#' 
#' \link{get_info}("wdbc"): Return a list with properties of the processed dataset
#' and metadata of the data source.
#' 
#' \link{load_data}("wdbc"): Load processed data into memory. 
#' If the data has not been processed before, also runs proc_data("wdbc").
#'
#' \link{proc_data}("wdbc"): Process the original data and save an rds file (for later use).
#' If the data has not been downloaded before, also runs get_data("wdbc").
#' 
#' \link{get_data}("wdbc"): Download the original data from the internet and save it locally.
#' 
#' The main reason the "_wdbc" functions are exported, is to allow easy inspection of the source code. 
#' In practice, the use of the wrapper versions without suffix "_wdbc"
#' is recommended, as shown in the examples. 
#' 
#' @references 
#' (1) <https://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+(diagnostic)>
#' (2) K. P. Bennett, "Decision Tree Construction Via Linear Programming." Proceedings of the 4th
#'  Midwest Artificial Intelligence and Cognitive Science Society, pp. 97-101, 1992
#' (3) K. P. Bennett and O. L. Mangasarian: "Robust Linear Programming Discrimination of Two
#'  Linearly Inseparable Sets", Optimization Methods and Software 1, 1992, 23-34.
#' 
#' @seealso \link{get_info}, \link{get_data}, \link{proc_data}, \link{load_data}
#'
#' @examples
#' get_info("wdbc") # get_info_wdbc()
#' get_data("wdbc") # get_data_wdbc()
#' proc_data("wdbc") # proc_data_wdbc()
#' load_data("wdbc") 
#' 
#' @name data_wdbc
NULL
#> NULL


#' @rdname data_wdbc
#' @export
get_info_wdbc <- function(...){
  
  ## define dataset information:
  define_info( 
    name = "wdbc",
    properties = list(
      class = "data.frame", 
      length = 31,
      nrow = 569, 
      ncol = 31 
    ),
    metadata = list(
      repository = "UCI",
      url = "https://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+(diagnostic)"
    )
  )
  
}


#' @rdname data_wdbc
#' @importFrom readr read_csv
#' @importFrom dplyr mutate mutate_all select
#' @export
proc_data_wdbc <- function(...){
  
  ## prepare column names:
  features <- c("radius", "texture", "perimeter", "area", "smoothness",
                "compactness", "concavity", "concave_points", "symmetry", "fractal_dimension")
  stats <- c("mean", "sd", "peak") 
  col_names <- c("id", "diagnosis",
                 paste(rep(features, times=3) , rep(stats, each=10), sep="_"))
  
  ## process original data:
  id <- diagnosis <- NULL
  data <- readr::read_csv(get_path("wdbc", "files", "wdbc.data.csv"),
                          show_col_types = FALSE, 
                          col_names = col_names,
                          col_types = readr::cols(.default="c"),
                          na = c("", "?")) %>% 
    dplyr::select(-id) %>%
    dplyr::mutate(diagnosis = dplyr::recode(diagnosis, M=1, B=0)) %>% 
    dplyr::mutate_all(as.numeric) %>%
    as.data.frame()
  
  ## save data (bundle) as RDS file:
  saveRDS(data, get_path("wdbc", "data.rds"))
  
  ## no return value:
  return(invisible(NULL))
}


#' @rdname data_wdbc
#' @param method character, see \link{download.file}
#' @importFrom utils download.file
#' @export
get_data_wdbc <- function(method = "curl", ...){
  
  ## download and save original data:
  "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data" %>% 
    utils::download.file(get_path("wdbc", "files", "wdbc.data.csv"), method=method)
  
  ## download and save documentation:
  "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.names" %>% 
    utils::download.file(get_path("wdbc", "files", "wdbc.names.txt"), method=method)
  
  ## no return value:
  return(invisible(NULL))
}




