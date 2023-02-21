#' @title basemap
#'
#' @description Function to return base map data
#'
#' @param countryname string, name of base map area.
#'
#' @return sf object
#'
#' @export

basemap <- function(countryname='world'){

  if (countryname == 'world'){

    basemap <- rnaturalearth::ne_countries(scale = 'large', returnclass = 'sf')

  } else {

    basemap <- rnaturalearth::ne_states(country = countryname, returnclass = 'sf')

  }

  return(basemap)

}
