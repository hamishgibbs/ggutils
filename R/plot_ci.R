plot_ci <- function(d, x_var, group_var = NULL, alpha = 0.2, fill = 'blue'){
  
  ci_cols <- setdiff(colnames(d), c(group_var, x_var))
  
  ci_cols_num <-  readr::parse_number(ci_cols)
  
  abs_diff <- abs(ci_cols_num - 50)
  
  testthat::expect_equal(length(ci_cols) / 2, length(unique(abs_diff)))
  
  ribbon_geom <- function(x_var, ymin, ymax, group_var = NULL, alpha = 0.2, fill = 'blue'){
    
    return(geom_ribbon(aes(x = !!sym(x_var), ymin = !! sym(ymin), ymax = !! sym(ymax)),
                       fill = fill,
                       alpha = alpha))
    
  }
  
  geoms <- list()
  
  for (diff in abs_diff %>% unique()){
    
    col_group <- ci_cols[abs_diff == diff]
    
    geoms <- append(geoms, ribbon_geom(x_var = x_var,
                                       ymin = col_group[1], 
                                       ymax = col_group[2], 
                                       group_var = group_var,
                                       alpha = alpha, 
                                       fill = fill))
    
  }
  
  return(geoms)
  
}