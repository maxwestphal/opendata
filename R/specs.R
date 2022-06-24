#' @importFrom usethis use_data
build_package_data <- function(...){
  dataset_names <- list(...)
  stopifnot(all(sapply(dataset_names, is.character)))
  datasets <- do.call(c, lapply(dataset_names, get_info))
  usethis::use_data(datasets, overwrite = TRUE)
}

## generate package data:
## DO NOT EDIT MANUALLY, but only via create_data_spec() or delete_data_spec()
build_package_data(
  "",
  "ctg",
	"wdbc",
	""
)

#' Description of the datasets covered by opendata
#'
#' A dataset describing properties and metadata of all datasets that can be accessed with opendata.
#'
#' @format A nested list whereby each (first level) element describes a dataset and has elements 
#' \describe{
#'   \item{properties}{describe the processed dataset, e.g. length, nrow, ncol, ...}
#'   \item{metadata}{describe the original data (source), e.g. repository, url, ...}
#' }
"datasets"

