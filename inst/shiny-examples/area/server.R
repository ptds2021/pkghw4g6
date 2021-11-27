#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(pkghw4g6)
library(shiny)

shinyServer(function(input, output) {

    simulate <- reactive({
        estimate_area(B = input$B, seed = input$seed)
    })

    output$plot <- renderPlot({
        plot(simulate())
    })

    output$area <- renderText({
        # extract the estimated value
        paste("The are of the shape S is:", simulate()[1] )
    })
})
