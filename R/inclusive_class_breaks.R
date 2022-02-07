#' @title inclusive_class_breaks
#'
#' @description Define class breaks using "styles" supported by `classInt::classIntervals()`. Inclusive breaks include the highest and lowest values in a variable.
#' @import classInt
#'
#' @param var numeric, input variable
#' @param style string, "style" of class breaks
#' @param n numeric, number of classes
#' @param offset numeric, offset added/subtracted from either end of `var`. Makes class breaks inclusive.
#'
#' @return numeric
#'
#' @export

inclusive_class_breaks <- function(var,
                                   style,
                                   n,
                                   offset=0.0000001){
  class_breaks <- classInt::classIntervals(
    var=var, style=style, n=n
  )
  br <- class_breaks$brks
  br[1] <- br[1] - offset
  br[length(br)] <- br[length(br)] + offset
  return(br)
}
