st <- data.frame(state.x77)
st[st$Population == max(st$Population), c(3, 6)]

subset(st,
      subset = st$Population == max(st$Population),
      select = c(3, 6)
)

iris[, 5]
subset(iris, select = 1:4)

sp <- split(iris, f = iris$Species)
length(sp)
names(sp)
class(sp)

df <- iris
df[, -5]
aggregate(df[, -5], by = list(품종 = df$Species), FUN = mean)
aggregate(df[, -5], by = list(품종 = df$Species), FUN = sd)

plot(iris)

library(MASS)
data("survey")
df <- survey
str(df)

df <- na.omit(df)
df
df <- df[complete.cases(df), ]
dim(df)

hist(df$Height, breaks = 20)

mean(df[df$Sex == "Male", ]$Height)
mean(df[df$Sex == "Female", ]$Height)

aggregate(
      df[, c(10, 12)],
      by = list(df$Sex),
      FUN = mean
)


sort(mtcars$mpg)
sort(mtcars$mpg, decreasing = T)
