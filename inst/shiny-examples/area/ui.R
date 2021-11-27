#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Area Estimation"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("seed",
                         "Seed:",
                         10),

            sliderInput("B",
                        "Number of data points",
                        min = 1,
                        max = 1000000,
                        value = 5000,
                        step = 10,
                        round = TRUE,
                        )
                    ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
            textOutput("time"),
            textOutput("area")
        )
    )
))
