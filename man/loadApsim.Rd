% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LoadAPSIMouts.R
\name{loadApsim}
\alias{loadApsim}
\title{Read APSIM .out files.}
\usage{
loadApsim(dir = NULL, loadAll = TRUE, filter = "\\\\.out",
  returnFrame = TRUE, n = 0, fill = FALSE, addConstants = TRUE,
  skipEmpty = FALSE)
}
\arguments{
\item{dir}{(optional) The directory to search for .out files. This is not recursive.
If omitted, the current working directory will be used.}

\item{loadAll}{If TRUE will load all files in \code{dir}. If FALSE, will load
a single file specified by \code{dir}. Default is TRUE.}

\item{filter}{A regular expression that matches the files to be loaded.
Default is \code{\\\\.out} which filters for standard apsim output files.}

\item{returnFrame}{Return the data as a data frame or data table. Default is 
TRUE, FALSE returns a data table.}

\item{n}{Read the first n files. Good for testing/debugging. Default is 0 
(read all files found).}

\item{fill}{Where the number or names of columns is not consistent across 
files, fill missing columns with NA. Default is FALSE which will throw an 
error if the columns don't match across all files.}

\item{addConstants}{Add any constants (such as ApsimVersion, Title or factor 
levels) found as extra columns. Default is TRUE.}

\item{skipEmpty}{Silently skip empty output files. If false, empty files
will cause an error. Default is FALSE.}
}
\description{
Reads APSIM .out files.
}
\details{
By default, this function will read in all output files in a directory and 
combine them into a single data table. Setting \code{loadAll=FALSE} will read
a single file. If the path is omitted it will try to find the file in the current
working directory. Constants in outputs will be added as data columns and output 
files with differing numbers of columns can also be imported although by 
default this will result in an error. Care should be taken when using this 
option as a different number of columns in output files usually means the 
data came from a different set of reports or simulations which may not be 
relevant to your analysis.
}
\examples{
\dontrun{loadApsim("c:/outputs") # load everything in the outputs directory}
\dontrun{loadApsim("c:/outputs/simulation.out", loadAll=FALSE) 
# load a single file (note extension is required).}
\dontrun{loadApsim("c:/outputs", returnFrame=FALSE, fill=TRUE) 
  # load everything in the outputs directory, fill any missing columns and return a data table.}
}
