#' Get sufffix of input file.
#'
#' @param file_name A string for file names.
#'
#' @return A string for the file format.
#' @export
#'
get_file_suffix <- function(file_name){
  # Paser file names and get the file suffix.
  # txt or csv
  if(grepl('.txt', file_name)){
    return('txt')
  }else{
    return('csv')
  }
}
