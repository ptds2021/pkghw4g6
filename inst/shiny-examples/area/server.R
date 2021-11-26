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
        rval.area <- estimate_area(B = input$B, seed = input$seed)[1]
        time <- system.time(estimate_area(B = input$B, seed = input$seed))

    })

    output$plot <- renderPlot({
        plot.area()

    })

    output$time <- renderText({

        paste0("The execution time is", time)

    })

    output$area <- renderText({

        paste0("The area of S is", rval.area)

    })

})
