#' Visualize results from fuzzy clusters with line chart
#'
#' @param input_data a data frame containing ID and expression profile.
#' @param group a factor for representing groups.
#' @param group_levels a factor levels for group.
#'
#' @param k_cluster number of clusters fuzzy cluster.
#' @param iteration a numeric value for interation, the defualt is 100.
#' @param mfrow a vector containing 2 elements for controling the subplots in graphic window, the default is mfrow = c(3,3)
#' @param min_mem cutoff value for membership. Only results with greater than min_mem are showed.
#' @param plot a boolean value for deciding whether ploting, the default is TRUE.
#'
#' @author Dongdong Zhan and Mengsha Tong
#'
#' @references (1) David Meyer, Evgenia Dimitriadou, Kurt Hornik, Andreas Weingessel and Friedrich Leisch (2017). e1071: Misc Functions of the \
#' Department of Statistics, Probability Theory Group (Formerly: E1071), TU Wien. R package version 1.6-8.https://CRAN.R-project.org/package=e1071 \
#' (2) Pengyi Yang (2018). ClueR: Cluster Evaluation. R package version 1.4. https://CRAN.R-project.org/package=ClueR
#'
#' @return A lines chart with fuzzy degree.
#' @export
#'
#' @examples
#' \dontrun{
#' visualization_fuzzycluster(
#'   input_data,
#'   group,
#'   group_levels,
#'   k_cluster,
#'   iteration = 100,
#'   mfrow = c(3,3),
#'   min_mem = 0.1,
#'   plot = TRUE
#' )
#' }

visualization_fuzzycluster <- function(input_data, group, group_levels,
                                                       k_cluster, iteration = 100, mfrow = c(3,3),
                                                       min_mem = 0.1, plot = TRUE){
  requireNamespace('e1071')
  requireNamespace('ClueR')
  deps_ID <- as.vector(input_data[,1])
  deps_value <- input_data[,-1]
  deps_value_row <- nrow(deps_value)
  deps_value_group_mean <- NULL
  for(i in seq_len(deps_value_row)){
    x <- as.vector(unlist(deps_value[i,]))
    x_g_m <- tapply(x, group, mean)
    deps_value_group_mean <- rbind(deps_value_group_mean, x_g_m)
  }
  colnames(deps_value_group_mean) <- group_levels
  rownames(deps_value_group_mean) <- deps_ID
  deps_value_scale <- t(scale(t(deps_value_group_mean)))
  clustObj <- e1071::cmeans(deps_value_scale, centers = k_cluster, iter.max=100, m=1.5)
  if(plot){
    ClueR::fuzzPlot(deps_value_scale, clustObj, llwd = 2, min.mem = min_mem, mfrow = mfrow)
  }
  return(clustObj)
}
