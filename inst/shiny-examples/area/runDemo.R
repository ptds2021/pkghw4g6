#' @title Running Shiny app
#' @description The function runs a Shiny web-application containing the interactive plot obtained from the package's functions estimate_area and plot_area, and it allows the user to choose the values of the arguments B and seed used for both functions.
#' @return A Shiny app with an interactive plot of the simulated data points obtained from the estimate_area function.
#' @export
runDemo <- function() {

  appDir <- system.file("shiny-examples", "area", package = "pkghw4g6")
  if (appDir == "") {
    stop(

      "Could not find example directory. Try re-installing pkghw4g6.",
      call. = FALSE
    )
  }

  shiny::runApp(appDir, display.mode = "normal")

}

