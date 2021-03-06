% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spec_ctg.R
\name{data_ctg}
\alias{data_ctg}
\alias{get_info_ctg}
\alias{proc_data_ctg}
\alias{get_data_ctg}
\title{Download, process and get information for the \strong{ctg} dataset.}
\usage{
get_info_ctg(...)

proc_data_ctg(...)

get_data_ctg(method = "curl", ...)
}
\arguments{
\item{...}{potential further arguments}

\item{method}{character, see \link{download.file}}
}
\value{
see details
}
\description{
Download, process and get information for the \strong{ctg} dataset.
}
\details{
"2126 fetal cardiotocograms (CTGs) were automatically processed and the respective diagnostic
features measured. The CTGs were also classified by three expert obstetricians and a consensus
classification label assigned to each of them. Classification was both with respect to a
morphologic pattern (A, B, C. ...) and to a fetal state (N, S, P). Therefore the dataset
can be used either for 10-class or 3-class experiments." \eqn{^1}

\link{get_info}("ctg"): Return a list with properties of the processed dataset
and metadata of the data source.

\link{load_data}("ctg"): Load processed data into memory.
If the data has not been processed before, also runs proc_data("ctg").

\link{proc_data}("ctg"): Process the original data and save an rds file (for later use).
If the data has not been downloaded before, also runs get_data("ctg").

\link{get_data}("ctg"): Download the original data from the internet and save it locally.

The main reason the "_ctg" functions are exported, is to allow easy inspection of the source code.
In practice, the use of the wrapper versions without suffix "_ctg"
is recommended, as shown in the examples.
}
\examples{
get_info("ctg") # get_info_ctg()
get_data("ctg") # get_data_ctg()
proc_data("ctg") # proc_data_ctg()
load_data("ctg") 

}
\references{
(1) \url{https://archive.ics.uci.edu/ml/datasets/cardiotocography}
}
\seealso{
\link{get_info}, \link{get_data}, \link{proc_data}, \link{load_data}
}
