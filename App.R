eui <- fluidPage(
  
  ui <- fluidPage(
    
    fluidRow(
      
      column(12,
             
             titlePanel("Coursera - Final  Project - Data Science"),
             h4("Please, digit your text in text box at left"),
             HTML("<p>&nbsp;"),
             align = "center",
             
             fluidRow(
               
               column(6,
                      
                      textInput("phrase", "Predict next word:", width = "100%"),
                      actionButton("goButton", "Go!")
                      
               ),
               column(width = 6,
                      
                      "The next word is:",
                      HTML(paste0("<b>",p(textOutput("predictWord")),"</b>"))
                      
                      )
             )
             
      )
      
    )
    
  )
  
)


server <- function(input, output) {
  
  library(shiny)
  library(ggplot2)
  suppressPackageStartupMessages(library("NLP"))
  suppressPackageStartupMessages(library("tm"))
  suppressPackageStartupMessages(library("wordcloud"))
  suppressPackageStartupMessages(library("RColorBrewer"))
  suppressPackageStartupMessages(source("functions.R"))
  suppressPackageStartupMessages(library("RWeka"))
  suppressPackageStartupMessages(library("qdap"))
  suppressPackageStartupMessages(library("ggplot2"))
  suppressPackageStartupMessages(library("ngram"))
  source("functions.R")
  
  output$predictWord <- renderText({
    
    input$goButton
    frase <- cleanPhrase(input$phrase)
    predictWord(frase)
    
  })
  
  
}

shinyApp(ui = ui, server = server)