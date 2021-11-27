# Test whether the plot (i.e. output) is visible
test_that("pkghw4g6 works", {
  area <- pkghw4v2::estimate_area()
  plot_shape <- pkghw4g6::plot(area)
  expect_visible(plot_shape)
})

# Test whether the estimate_area function returns a value and the data frame
test_that("an error message is provided if wrong inputs", {

})
