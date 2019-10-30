eui <- fluidPage(
  
  ui <- fluidPage(
    
    fluidRow(
      
      column(12,
             
             titlePanel("Coursera - Final  Project - Data Science"),
             h4("Please, digit your phrase in text box at left"),
             HTML("<p>&nbsp;"),
             align = "center",
             
             fluidRow(
               
               column(6,
                      
                      textInput("phrase", "Predict next word:", width = "100%"),
                      actionButton("goButton", "Go!")
                      
               ),
               column(width = 6,
                      
                      "The next word for:",
                      p(textOutput("frase")),
                      "is: ",
                      HTML(paste0("<b>",p(textOutput("predictWord")),"</b>"))
                      
                      )
             ),
             fluidRow(
               
               column(12,
                      
                      HTML("<P><BR><P><BR><P><BR><P>"),
                      h3("Capstone Project"),
                      p("========================================================"),
                      p("author: Marcelo Gomes Gadelha"),
                      p("date: 10/28/2019"),
                      p("Coursera - John Hopkins")
                      
                      
               )
             )
             
      )
      
    )
    
  )
  
)


server <- function(input, output) {
  
  library("tm")
  library("stringr")
  
  source("functions.R")
  
  gram2 <<- readRDS(file = "gram2_0.05.Rda")
  gram3 <<- readRDS(file = "gram3_0.05.Rda")
  gram4 <<- readRDS(file = "gram4_0.05.Rda")
  
  output$predictWord <- renderText({
    
    input$goButton
    frase <- cleanPhrase(input$phrase)
    predictWord(frase)
    
  })
  
  
  
  output$frase <- renderText({
    
    input$goButton
    qtd_words <- sapply(strsplit(input$phrase, " "), length)
    if(qtd_words > 0) input$phrase
    else "Digit Something..."
    
  })
  
  
}

shinyApp(ui = ui, server = server)
