#' @title summarise_ci
#'
#' @description Function to summarise a target variable given a vector of density intervals by group
#'
#' @param data data.frame, data to be summarised.
#' @param group_variables character vector, grouping variables.
#' @param summary_variable character, variable to be sumamrised.
#' @param ci float vector, ci intervals.
#'
#' @return sf object
#'
#' @export

summarise_ci <- function(data, 
                         group_variables, 
                         summary_variable, 
                         ci = c(0.1, 0.9, 0.4, 0.6, 0.25, 0.75)){
  
  .vars <- rlang::syms(group_variables)
  
  p_names <- map_chr(ci, ~paste0("ci_", .x*100))
  
  p_funs <- map(ci, ~partial(quantile, probs = .x, na.rm = TRUE)) %>% 
    set_names(nm = p_names)
  
  data <- data %>% 
    group_by(!!! .vars) %>% 
    summarize_at(vars("perc_difference"), .funs = p_funs)
  
  return(data)
  
}