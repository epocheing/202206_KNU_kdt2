library(shiny)
library(tidyverse)


ui <- pageWithSidebar(
    headerPanel(h1("데이터테이블 예제")),
    sidebarPanel(
        checkboxGroupInput(
            "showvars", "원하는 컬럼은?",
            names(diamonds),
            selected = names(diamonds)
        )
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("diamonds", dataTableOutput("mytable1")),
            tabPanel("iris", dataTableOutput("mytable2")),
            tabPanel("mtcars", dataTableOutput("mytable3")),
            tabPanel("state.x77", dataTableOutput("mytable4"))
        )
    )
)


server <- function(input, output) {
    output$mytable1 <- renderDataTable({
        diamonds[, input$showvars]
    })

    output$mytable2 <- renderDataTable(
        {
            iris
        },
        options = list(bSortClasses = TRUE)
    )

    output$mytable3 <- renderDataTable(
        {
            mtcars
        },
        options = list(
            aLengthMenu = c(5, 30, 50),
            iDisplayLength = 5
        )
    )

    output$mytable4 <- renderDataTable({
        state.x77
    })
}


shinyApp(ui, server)
