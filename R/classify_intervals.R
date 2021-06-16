#' @title classify_intervals
#'
#' @description Function to classify data in custom intervals
#'
#' @param data data.frame, input data.frame
#' @param value string, variable name of value to classify
#' @param breaks vector numeric, class breaks
#' @param sym_start string, start of interval label. Default: "(".
#' @param sym_sep string, separator of interval label. Default: "to ".
#' @param sym_end string, end of interval label. Default: "]".
#'
#' @return data.frame
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

classify_intervals <- function(data,
                               value,
                               breaks,
                               sym_start = "(",
                               sym_sep = " to ",
                               sym_end = "]"){

  return(
    data %>%
      dplyr::mutate(value = cut(!! sym(value),
                                breaks = breaks,
                                labels = label_interval(breaks,
                                                        sym_start,
                                                        sym_sep,
                                                        sym_end)))
  )

}
