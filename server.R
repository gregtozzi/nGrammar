library(shiny)
source('app_functions.R')
load('model_output')
load('pentGramModel')

shinyServer(function(input, output) {
  
  # You can access the value of the widget with input$text, e.g.
  #output$value <- renderUI({ clean_input(input$inputText) })
  output$value <- renderUI({ model_search(input$inputText, finalModel)[[1]] })
  
})