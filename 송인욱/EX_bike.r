df <- read.csv("bike.csv", header = T)
str(df)
summary(df)

head(df)

plot(df$casual, df$count)

plot(df$registered, df$count)
cor(df$atemp, df$casual)
cor(df$atemp, df$registered)


cor(df$humidity, df$casual)
cor(df$humidity, df$registered)
