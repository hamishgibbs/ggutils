testthat::test_that('classify_intervals works as expected', {

  data <- data.frame(value = c(1, 2, 3))
  breaks <- c(1, 2, 3)

  res <- classify_intervals(data, "value", breaks)

  testthat::expect_identical(levels(res$value),
                             c("(1.0 to 2.0]", "(2.0 to 3.0]"))

})
