
library(shiny)
library(plotly)

years = c("2015","2016","2017")
chlamydia_count = c(9329,10192,10937)
pertussis_count = c(168,196,118)
salmonella_count = c(313,311,304)

ui <- fluidPage(
  selectInput(inputId = "disease", 
              label = "Disease", 
              choices = c("Chlamydia", 
                          "Pertussis", 
                          "Salmonella"),
              selected = "Chlamydia"),
  
  plotlyOutput("diseasePlot", 
               height = "300px", 
               width = "500px")
)

server <- function(input, output) {
  
  output$diseasePlot <- renderPlotly({
    if(input$disease == "Chlamydia"){
      count = chlamydia_count}
    if(input$disease == "Pertussis"){
      count = pertussis_count}
    if(input$disease == "Salmonella"){
      count = salmonella_count}

    plot_ly(x=years, y=count,
            type = "bar") %>%
      layout(
        yaxis = list(title=paste(input$disease, "Cases")),
        xaxis = list(title="Year")
      )

  })
}

shinyApp(ui, server)
