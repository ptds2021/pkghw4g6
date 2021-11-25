#' @export
runDemo <- function() {
  # REPLACE N BY YOUR GROUP NUMBER AND DELETE THIS COMMENT
  appDir <- system.file("shiny-examples", "area", package = "pkghw4gN")
  if (appDir == "") {
    stop(
      # REPLACE N BY YOUR GROUP NUMBER AND DELETE THIS COMMENT
      "Could not find example directory. Try re-installing pkghw4gN.",
      call. = FALSE
    )
  }

  shiny::runApp(appDir, display.mode = "normal")

}
