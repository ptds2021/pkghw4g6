# Test whether the plot (i.e. output) is visible
test_that("pkghw4g6 works", {
  area <- pkghw4v2::estimate_area()
  plot_shape <- pkghw4g6::plot(area)
  expect_visible(plot_shape)
})

# Test inputs provided
test_that("input check", {
  expect_error(estimate_area(B = 0, seed = 10))
})

# Test inputs provided
test_that("input check", {
  expect_error(estimate_area(B = 1000, seed = 0))
})

# Test inputs provided
test_that("input check", {
  expect_error(estimate_area(B = "group 6", seed = 10))
})

# Test inputs provided
test_that("input check", {
  expect_error(estimate_area(B = 1000, seed = 10))
})




