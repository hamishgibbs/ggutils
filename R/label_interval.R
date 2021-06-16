#' @title label_interval
#'
#' @description Function to label a single interval with custom text. Called internally by classify_intervals.
#' @import scales
#'
#' @param breaks vector numeric, class breaks
#' @param sym_start string, start of interval label.
#' @param sym_sep string, separator of interval label.
#' @param sym_end string, end of interval label.
#'
#' @return string
#'
#' @export

label_interval <- function(breaks,
                           sym_start,
                           sym_sep,
                           sym_end) {
  paste0(sym_start,
         scales::comma(breaks[1:length(breaks) - 1]),
         sym_sep,
         scales::comma(breaks[2:length(breaks)]),
         sym_end
  )

}
