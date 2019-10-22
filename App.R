ui <- fluidPage(
  
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
  
  output$predictWord <- renderText({
    
    input$goButton
    input$phrase
    
  })
  
  
}

shinyApp(ui = ui, server = server)