library(tidyverse)
library(ggmap)
library(plotly)
library(shiny)

register_google(key = "AIzaSyBKvo0pl7gf3KVUAWwQ_h8Hw2z5h40UgFM")
map <- get_map(location = "south korea", zoom = 7, maptype = "roadmap", color = "bw")
df <- read.csv("data.csv", header = TRUE)
map_hangmok <- c("서울", "광역시", "중소도시", "읍면지역")
make_map <- subset(df, 항목 %in% map_hangmok)


ui <- pageWithSidebar(
    headerPanel(
        h1("인욱")
    ),
    sidebarPanel(
        sliderInput(
            "year", "연도",
            min = 2007, max = 2020,
            value = 2007, step = 1,
            animate = animationOptions(interval = 1000, loop = FALSE)
        )
    ),
    mainPanel(
        plotlyOutput("mapPlot")
    )
)


server <- function(input, output) {
    output$mapPlot <- renderPlotly({
        p <- ggmap(map) +
            geom_point(
                data = make_map[make_map$시점 == input$year, ],
                aes(x = long, y = lat, size = 사교육비, color = 항목, alpha = 0.5)
            ) +
            scale_size_continuous(range = c(2, 22)) +
            theme_void() +
            coord_map()
        ggplotly(p)
    })
}



shinyApp(ui, server)
