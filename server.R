#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        # Read input variable
        col <- reactive({
                input$select 
        })
        

        # Form a formula to plot variables
        formula <- reactive({
                paste("mpg ~", input$select)
        })
        
        # linear model preparation
        mf <- reactive({
                lm(as.formula(formula()), data = mtcars)
        })
        
        equation <- reactive({    
                coeffs = coefficients(mf())
                conc = "+"
                if (coeffs[2] < 0){
                        conc = ""
                }
                
        paste(round(coeffs[1], digits = 2), conc , round(coeffs[2], digits = 2) , "*" , col() , sep = " ")
        })
        
  output$distPlot <- renderPlot({
#    Plot the chart
#        mpgInput <- input$sliderMPG
        plot(as.formula(formula()), 
        data = mtcars, ylab="MPG", xlab=col(), col="blue")
        abline(mf())
#        points(mpgInput,pch=0:25, bg= "red")
        

  })
  output$mpg = renderText(input$select)
})
