#' @title Estimation of a shape area function
#' @description Estimates the area of a shape S by simulating random coordinates in a one by one square.
#' @param B Number of random data points (x,y) to generate.
#' @param seed Pseudorandom number generator.
#' @return A \code{list} with estimation of the area of S and the simulated data points.
#' @aliases estimate_area,plot
#' @export
#' @examples
#' estimate_area(B = 3456, seed = 100)
estimate_area <- function(B = 5000, seed = 10){

  # Control seed
  set.seed(seed)

  # Check inputs
  if (is.numeric(B) == TRUE & is.numeric(seed) == TRUE){

    if(B%%1 != 0 | B < 1 | seed%%1 != 0 | seed < 1) {
      stop("Error: wrong inputs provided")
    } else {

  # Simulate B points
  points <- data.frame(
    x = stats::runif(n = B, min = 0, max = 1),
    y = stats::runif(n = B, min = 0, max = 1),
    inside = rep(NA,B)
  )

  # Create a vector Z and a loop
  Z <- logical()

  for (i in 1:B){

    x <- points[i,1]
    y <- points[i,2]

    if (x^2 + y^2 > 0.5^2 & (x-0.5)^2 +(y-0.5)^2 < 0.5^2 &  y > x - 0.5 ){

      Z[i] =  1  # true if a data point lies in the shape
      points[i,3] = TRUE

    }else{

      Z[i] = 0  # false if data points doesn't lie in the shape
      points[i,3] = FALSE

    }
  }

  # Compute area of shape
  area_square <- 1*1
  estimated_area <- area_square * (sum(Z)/B)

  # Create a structure with class "area"
  rval <- structure(
    list(
      estimated_area = estimated_area,
      points = points),
    class = "area"
  )

  # typeof(rval) # list

  return(rval)

    }
  } else {
    stop("Error: wrong inputs provided")
  }
}

#' @title Plotting of a shape area function
#' @description Plot the area of a shape S by simulating random coordinates in a one by one square.
#' @param x Return value from the estimation of the area of the shape function.
#' @return Shape S and the simulated data points (within the shape and outside the shape).
#' @export
#' @examples
#' plot(x = estimate_area())
plot_area <- function(x) {   # x is rval

  x <- estimate_area()
  points <- x[["points"]]

  # plot points
  ggplot2::ggplot(data = points) +

    ggplot2::geom_point(mapping = ggplot2::aes(x = points[,1],
                                               y = points[,2]),
                        alpha = 0.2) +

    ggplot2::theme_bw() +

    ggplot2::theme(panel.grid = ggplot2::element_line(linetype = "dashed",
                                                      color = "grey")) +

    # Rename axes
    ggplot2::xlab("x") +
    ggplot2::ylab("y") +

    # Plot frame around points
    ggplot2:: geom_hline(yintercept = c(0, 1),
                         linetype = "dashed",
                         color = "blue") +

    ggplot2::geom_vline(xintercept = c(0, 1),
                        linetype = "dashed",
                        color = "blue") +

    # Plot shape S
    ggplot2::stat_function(fun = function(x) (sqrt(-(x^2) + 0.5^2)),  # D1
                           color = "blue") +

    ggplot2::stat_function(fun = function(x) (sqrt(0.5^2 - (x-0.5)^2) + 0.5), # D2
                           color = "blue") +

    ggplot2::stat_function(fun = function(x) x - 0.5, # D3
                           color = "blue") +

    # Removing negative area
    ggplot2::scale_x_continuous(limits = c(0, 1)) +
    ggplot2::scale_y_continuous(limits = c(0, 1)) +

    # Adds data points
    ggplot2::geom_point(ggplot2::aes(points$x,  points$y),
                        col = ifelse(points$inside == TRUE,
                                     "darkturquoise",
                                     "lightpink"))

}
