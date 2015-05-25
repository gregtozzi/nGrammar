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
                                                              placeholder = "Copy your text here...")))}))),
                  
                  # The output line
                  fluidRow(column(12,
                                  uiOutput(outputId="value",
                                           class="theAnswer")))

                  ))