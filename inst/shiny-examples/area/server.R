#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {

    simulate <- reactive({
        # simulate the area of S and measure the time here
        ...
    })

    output$plot <- renderPlot({
        # plot area
        ...
    })

    output$time <- renderText({
        # extract the time of the execution
        ...
    })

    output$area <- renderText({
        # extract the estimated value
        ...
    })

})
