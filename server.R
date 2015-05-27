library(shiny)
source('app_functions.R')
load('model_output')
load('pentGramModel')

shinyServer(function(input, output) {
  
  modelOutput <- reactive({
    model_search(input$inputText, finalModel)[[1]]
  })
  
  output$button_row <- renderUI({
    div(class = "container",
        style = "text-align:center",
        actionButton("button1", label = modelOutput()[1]),
        actionButton("button2", label = modelOutput()[2]),
        actionButton("button3", label = modelOutput()[3]))
  })
  
})