#' @title qualitative_pal
#'
#' @description Function to define a palette of distinct colors
#'
#' @param labels string vector, name to be symbolized.
#'
#' @return named character vector.
#'
#' @export

qualitative_pal <- function(labels){

  qual_col_pals <-  RColorBrewer::brewer.pal.info[RColorBrewer::brewer.pal.info$category == 'qual',]

  base_pal <- unlist(mapply(RColorBrewer::brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

  pal <-  rep(base_pal, ceiling(length(labels) / length(base_pal)))

  pal <- pal[1:length(labels)]

  names(pal) = labels

  return(pal)

}
