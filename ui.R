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
  titlePanel("Shiny Assignment Week4 - Predict mpg"),
  
  # Sidebar with a variable input  
  sidebarLayout(
    sidebarPanel(
            h4("Select Variable to predict mpg."),
            selectInput("select", "Predict against Variable:",
                        list("Horse Power" = "hp", 
                             "Weight" = "wt", 
                             "Cylinders" = "cyl"))
#            sliderInput("sliderMPG","MPG of the car",0,40,value = 5)
    ),
   
    # Show a plot of the generated distribution
    mainPanel(
        h5("Predicted MPG against"),
        textOutput("mpg"),
        h4(),
        h4(),
        h4("Linear Regression Plot"),
        plotOutput("distPlot")
    )
  )
))
