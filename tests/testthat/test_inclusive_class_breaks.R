testthat::test_that('inclusive_class_breaks works as expected', {


  res <- inclusive_class_breaks(1:100, "quantile", 4, 1)
  exp <- c(0, 25.75, 50.50, 75.25, 101)

  testthat::expect_equal(res, exp)

})
