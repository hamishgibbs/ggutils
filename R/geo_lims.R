#' @title geo_lims
#'
#' @description Define plot lims using a spatial object
#'
#' @param object data.frame, Combined mobility data.
#' @param zoom_x x zoom
#' @param zoom_y y zoom
#'
#' @return list
#'
#' @export

geo_lims <- function(object, zoom_x = 0, zoom_y = 0){

  bbox <- sf::st_bbox(object)

  lims <- list(
    ggplot2::xlim(bbox$xmin - zoom_x, bbox$xmax + zoom_x),
    ggplot2::ylim(bbox$ymin - zoom_y, bbox$ymax + zoom_y)
  )

  return(lims)

}
