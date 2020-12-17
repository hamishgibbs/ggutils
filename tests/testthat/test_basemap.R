testthat::test_that('basemap works as expected', {
  
  testthat::expect_true('sf' %in% class(basemap('world')))
  
})