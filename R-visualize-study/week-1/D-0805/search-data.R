?iris
head(iris)

iris$Sepal.Length

# palmerpenguins 팽귄 데이터셋 활용
library(palmerpenguins)
library(VIM)

data(package = "palmerpenguins")

pg <- data.frame(penguins)
str(pg)
dim(pg)

table(pg$species)
barplot(table(pg$species))

table(pg$island)
barplot(table(pg$island))

str(pg[, 3:6])
summary(pg[, 3:6])

par(mfrow = c(2, 2))
hist(pg$bill_length_mm, col = 2:5)
hist(pg$bill_depth_mm, col = 5:7)
hist(pg$flipper_length_mm, col = 10:16)
hist(pg$body_mass_g, col = c(
    "orange", "violet", "steelblue"
))

par(mfrow = c(1, 1))

my.color <- ifelse(pg$species == "Gentoo", "tomato",
    ifelse(pg$species == "Adelie", "steelblue", "yellow")
)

plot(pg$bill_length_mm, pg$bill_depth_mm,
    pch = 19, col = my.color
)
