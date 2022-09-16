library(shiny)
library(ggplot2)
library(gapminder)


### ui
ui <- fluidPage(
    tags$h1("자, 이제 너의 선택을 보여줘!"),
    selectInput("dataset",
        label = "Dataset",
        choices = c("iris", "mtcars", "state.x77")
    ),
    tableOutput("table"),
    verbatimTextOutput("summary")
)


### server
server <- function(input, output) {
    dataset <- reactive({
        get(input$dataset, "package:datasets")
    })

    output$summary <- renderPrint({
        summary(dataset())
    })

    output$table <- renderTable({
        cat(input$dataset, "\n")
        head(dataset(), 5)
    })
}


### run app
shinyApp(ui = ui, server = server)
