library(shiny)
library(shinyjs)

shinyUI(fluidPage(theme = "nGrammar.css",
                  useShinyjs(),
                  extendShinyjs("www/nGrammar.js"),
                  
                  # Application title
                  title = "n|Grammar",
                  
                  # The title line
                  fluidRow(column(12,
                                  h1("n|Grammar", class = "mainTitle"))),
                  
                  # The input line
                  fluidRow(column(12,
                                  withTags({div(class="container",
                                                section(class="header",
                                                        input(type = "text",
                                                              id="inputText",
                                                              name = "inputText",
                                                              class = "inputLine",
                                                              placeholder = "Copy or type your text here...")))}))),
                  
                  # The new output line
                  fluidRow(column(12,
                                  uiOutput("button_row")
                  )),
                  
                  # The javascript-enabled output line
                  fluidRow(column(12,
                                  withTags({div(class = "container",
                                                style = "text-align:center",
                                                actionButton("button4", label = "button4"),
                                                actionButton("button5", label = "button5"),
                                                actionButton("button6", label = "button6"))})))
                                                
                  ))