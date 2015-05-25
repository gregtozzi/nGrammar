library(shiny)
source('app_functions.R')
load('model_output')
load('pentGramModel')

shinyServer(function(input, output) {
  
  modelOutput <- reactive({
    model_search(input$inputText, finalModel)[[1]]
  })
  
  output$button_1 <- renderUI({
    actionButton("button1", label = modelOutput()[1])
  })
  
  output$button_2 <- renderUI({
    actionButton("button2", label = modelOutput()[2])
  })
  
  output$button_3 <- renderUI({
    actionButton("button3", label = modelOutput()[3])
  })
  
})