#' @title Download, process and get information for the **ctg** dataset. 
#'
#' @param ... potential further arguments 
#' 
#' @return see details
#' 
#' @details 
#' "2126 fetal cardiotocograms (CTGs) were automatically processed and the respective diagnostic
#' features measured. The CTGs were also classified by three expert obstetricians and a consensus
#' classification label assigned to each of them. Classification was both with respect to a
#' morphologic pattern (A, B, C. ...) and to a fetal state (N, S, P). Therefore the dataset
#' can be used either for 10-class or 3-class experiments." \eqn{^1}
#' 
#' \link{get_info}("ctg"): Return a list with properties of the processed dataset
#' and metadata of the data source.
#' 
#' \link{load_data}("ctg"): Load processed data into memory. 
#' If the data has not been processed before, also runs proc_data("ctg").
#'
#' \link{proc_data}("ctg"): Process the original data and save an rds file (for later use).
#' If the data has not been downloaded before, also runs get_data("ctg").
#' 
#' \link{get_data}("ctg"): Download the original data from the internet and save it locally.
#' 
#' The main reason the "_ctg" functions are exported, is to allow easy inspection of the source code. 
#' In practice, the use of the wrapper versions without suffix "_ctg"
#' is recommended, as shown in the examples. 
#' 
#' @references 
#' (1) <https://archive.ics.uci.edu/ml/datasets/cardiotocography>
#' 
#' @seealso \link{get_info}, \link{get_data}, \link{proc_data}, \link{load_data}
#'
#' @examples
#' get_info("ctg") # get_info_ctg()
#' get_data("ctg") # get_data_ctg()
#' proc_data("ctg") # proc_data_ctg()
#' load_data("ctg") 
#' 
#' @name data_ctg
NULL
#> NULL


#' @rdname data_ctg
#' @export
get_info_ctg <- function(...){
  
  ## define dataset information:
  define_info( 
    name = "ctg",
    properties = list(
      class = "data.frame", 
      length = 26,
      nrow = 2126, 
      ncol = 26 
    ),
    metadata = list(
      repository = "UCI",
      url = "https://archive.ics.uci.edu/ml/datasets/cardiotocography"
    )
  )
}


#' @rdname data_ctg
#' @importFrom readxl read_excel
#' @importFrom dplyr mutate select all_of
#' @export
proc_data_ctg <- function(...){
  
  ## load original data:
  data <- readxl::read_excel(path = get_path("ctg", "files", "CTG.xls"), sheet =  3)
  
  ## remove last 3 rows which apparently do not contain regular observations:
  data <- data[- which(rowSums(is.na(data))>0), ]
  
  ## process data:
  cols_rm <- which(colnames(data) %in% 
                     c("FileName", "SegFile", "b", "e", "A", "B", "C",
                       "D", "E", "AD", "DE", "LD", "FS", "SUSP"))
  
  Tendency <- CLASS <- NSP <- Date <- NULL
  
  data <- data %>% 
    dplyr::mutate(Tendency = factor(Tendency),
                  CLASS = factor(CLASS),
                  NSP = factor(NSP)) %>%
    dplyr::mutate(Date = (as.Date(Date, format="%d.%m.%Y"))) %>%
    dplyr::select(-dplyr::all_of(cols_rm)) %>% 
    as.data.frame()
  
  ## save data (bundle) as RDS file:
  saveRDS(data, get_path("ctg", "data.rds"))
  
  ## no return value:
  return(invisible(NULL))
}


#' @rdname data_ctg
#' @param method character, see \link{download.file}
#' @importFrom utils download.file
#' @export
get_data_ctg <- function(method = "curl", ...){
  
  ## download and save original data:
  url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00193/CTG.xls"
  utils::download.file(url, get_path("ctg", "files", "CTG.xls"), method=method)
  
  ## no return value:
  return(invisible(NULL))
}




