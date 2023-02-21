#' @title plot_basemap
#'
#' @description Plot a global base map with optional country focus map
#'
#' @param countryname string, name of base map area.
#' @param world_fill string, fill color of world data. Defaults to 'transparent'.
#' @param world_size float, line thickness of world data. Defaults to 0.5.
#' @param world_color string, line color of world data. Defaults to 'black'.
#' @param country_fill string, fill color of country data. Defaults to 'transparent'.
#' @param country_size float, line thickness of country data. Defaults to 0.5.
#' @param country_color string, line color of country data. Defaults to 'black'.
#'
#' @return list
#'
#' @export
#'

plot_basemap <- function(countryname=NULL,
                         world_fill='transparent',
                         world_size=0.05,
                         world_color='black',
                         country_fill='transparent',
                         country_size=0.1,
                         country_color='black'
                         ){

  world_geom <- ggplot2::geom_sf(data = basemap('world'),
                                 fill = world_fill,
                                 size = world_size,
                                 color = world_color)

  if (!is.null(countryname)){

    country_geom <- ggplot2::geom_sf(data = basemap(countryname),
                                     fill = country_fill,
                                     size = country_size,
                                     color = country_color)

  } else {

    country_geom <- NULL

  }

  geom <- list(
    world_geom,
    country_geom
  )

  return(geom)

}
