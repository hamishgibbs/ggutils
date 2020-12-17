#' Save a pdf and png image with identical path and filename
#'
#' @import ggplot2
#' @param p ggplot object, ggplot object to be saved
#' @param path character, output pdf filepath
#' @param width numeric, output figure width (inches)
#' @param height numeric, output figure height (inches)
#' @return none
#' @export

ggsave_png_pdf <- function(p, path, width = 8.5, height = 6){

  ggplot2::ggsave(path,
                  p,
                  width = width,
                  height = height,
                  units = 'in')

  ggplot2::ggsave(gsub('.png', '.pdf', path),
                  p,
                  useDingbats = FALSE,
                  width = width,
                  height = height,
                  units = 'in')

}
