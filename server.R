library(shiny)
source('app_functions.R')
load('model_output')
load('pentGramModel')

shinyServer(function(input, output, session) {
  
  modelOutput <- reactive({
    model_search(input$inputText, finalModel)
  })
  
  output$button_row <- renderUI({
    div(class = "container",
        style = "text-align:center",
        actionButton("button1", label = modelOutput()[[1]][1], style = text_color(modelOutput()[[2]][[1]])),
        actionButton("button2", label = modelOutput()[[1]][2], style = text_color(modelOutput()[[2]][[2]])),
        actionButton("button3", label = modelOutput()[[1]][3], style = text_color(modelOutput()[[2]][[3]])))
  })
  
  onclick(expr = js$inputAppend(modelOutput()[[1]][1]), id = "button4")
  onclick(expr = js$inputAppend(modelOutput()[[1]][2]), id = "button5")
  onclick(expr = js$inputAppend(modelOutput()[[1]][3]), id = "button6")
  
})