library(shiny)

shinyUI(fluidPage(theme = "nGrammar.css",
                  
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
                                  uiOutput("button_1"),
                                  uiOutput("button_2"),
                                  uiOutput("button_3")
                  ))

                  ))