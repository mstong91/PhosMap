% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualization_deps_with_scatter.R
\name{visualization_deps_with_scatter}
\alias{visualization_deps_with_scatter}
\title{Visualize differentially expressed results with scatter}
\usage{
visualization_deps_with_scatter(deps_data, minFC = 2, minPvalue = 0.05,
  main = "Differentially expressed proteins", show_text = FALSE,
  min_up_text = 15, min_down_text = 15)
}
\arguments{
\item{deps_data}{a data frame containing ID, logFC and pvalue.}

\item{minFC}{a numeric for the minimum fold change.}

\item{minPvalue}{a numeric for the significance cutoff.}

\item{main}{an overall title for the plot.}

\item{show_text}{a boolean value representing whether or not the text is showed, the default is FALSE.}

\item{min_up_text}{cutoff value for showing up-IDs. Only IDs with lower than min_up_text are showed.}

\item{min_down_text}{cutoff value for showing down-IDs. Only IDs with lower than min_down_text are showed.}
}
\value{
A scatter plot for showing differentially expressed results.
}
\description{
Visualize differentially expressed results with scatter
}
\examples{
\dontrun{
visualization_deps_with_scatter(
  deps_data,
  minFC = 2,
  minPvalue = 0.05,
  main = 'Differentially expressed proteins',
  show_text = FALSE,
  min_up_text = 15,
  min_down_text = 15
)
}
}
\author{
Dongdong Zhan and Mengsha Tong
}
