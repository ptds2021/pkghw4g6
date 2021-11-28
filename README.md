pkgdown <img src="pkghw4g6/man/figures/logo.png" align="right" height=76 width=76 /> 

area {pkghw4g6}

# Estimate and plot the area of a shape

pkghw4g6 allows to estimate the area of a shape and plot the shape S in two steps. This package requires the packages *stats* and *ggplot2*.

## estimate_are() function

First, it uses a function estimate_area() that takes two arguments: 

- B: number of random data points (i.e. coordinates (x,y))
- seed: random number generator (for reproducibility)

This function simulate B coordinates and stores them in a data frame of three columns: x, y and inside in which the third column indicates whether data points lie within the shape's limits or not (TRUE or FALSE).

The shape S is delimited by three constraints:

- constraint 1: x^2 + y^2 > 0.5^2
- constraint 2: (x-0.5)^2 +(y-0.5)^2 < 0.5^2
- constraint 3: y > x - 0.5

Once the data points are simulated and have a logical value (TRUE or FALSE) assigned, the function returns the estimated return value (i.e. area of the shape) by summing up all TRUE values and divide it by the total number of simulated data points B. The return value is stored in a list containing the returned estimated values and all data points. 

## plot_area() function

Then, it uses a second function plot_area() to plot the shape and the data points. This function uses the ggplot2 package and its ggplot() function to plot the shape constraints, B data points.

The plot object returns a graph with a one-by-one frame around B simulated data points and a shape drawn using the three constraints listed above. Data points are either in red within the limits of the shape or in blue outside the shape. 

[![R-CMD-check](https://github.com/ptds2021/pkghw4g6/workflows/R-CMD-check/badge.svg)](https://github.com/ptds2021/pkghw4g6/actions)
