testthat::test_that('label_interval works as expected', {

  breaks <- c(1, 2)

  label <- label_interval(breaks, "(", " to ", "]")

  testthat::expect_identical(label,
                             "(1 to 2]")

})
