#' @title geo_lims
#'
#' @description Define plot lims using a spatial object
#'
#' @param object data.frame, Combined mobility data.
#'
#' @return list
#'
#' @export

geo_lims <- function(object){

  bbox <- sf::st_bbox(object)

  lims <- list(
    ggplot2::xlim(bbox$xmin, bbox$xmax),
    ggplot2::ylim(bbox$ymin, bbox$ymax)
  )

  return(lims)

}
