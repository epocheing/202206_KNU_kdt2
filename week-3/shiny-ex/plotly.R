library(plotly)
library(tidyverse)
library(gapminder)
library(palmerpenguins)

df <- data.frame(
    x = c(1, 2, 3, 4),
    y = c(1, 2, 3, 4),
    f = c(1, 2, 3, 4)
)

p <- ggplot(df, aes(x, y)) +
    geom_point(aes(frame = f))


p2 <- ggplot(
    subset(gapminder, year == 2007),
    aes(x = gdpPercap, y = lifeExp)
) +
    geom_point(aes(color = continent)) +
    scale_x_log10() +
    geom_smooth()

ggplotly(p2)

data(sleep)
sleep |>
    plot_ly() |>
    add_trace(
        x = ~ID, y = ~extra, type = "bar"
    ) |>
    layout(
        title = "Bar Plot",
        xaxis = list(title = "Species"),
        yaxis = list(title = "Frequency")
    )

str(gapminder)

gapminder[gapminder$year == 2007, ] |>
    plot_ly(
        x = ~gdpPercap,
        y = ~lifeExp,
        name = ~country,
        hovertext = ~pop,
        hoverinfo = "x+y+name+text"
    )
