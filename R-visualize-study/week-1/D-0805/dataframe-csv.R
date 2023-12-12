df <- iris
df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width

write.csv(df, "my.iris.csv")

library(readxl)

getwd()
df <- read_excel("week_1/Data/ex_data.xlsx", sheet = 1)
df

str(df)
class(df)

df <- data.frame(df)
str(df)
df$평균 <- apply(df[, 3:5], MARGIN = 1, mean)
head(df)
