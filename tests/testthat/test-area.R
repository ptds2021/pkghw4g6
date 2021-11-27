# Test whether the plot (i.e. output) is visible
test_that("pkghw4g6 works", {
  area <- pkghw4v2::estimate_area()
  plot_shape <- pkghw4g6::plot(area)
  expect_visible(plot_shape)
})
