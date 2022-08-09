getwd()
df <- read.csv("Diamonds Prices2022.csv", header = T)

str(df)
sum(!complete.cases(df))

levels(factor(df$color))

f.cut <- factor(df$cut, levels = c("Fair", "Good", "Very Good", "Premium", "Ideal"))
f.color <- factor(df$color, levels = rev(levels(factor(df$color))))
f.clarity <- factor(df$clarity, levels = c("I1", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF"))

levels(f.clarity)
levels(f.color)
levels(f.cut)
df$cut <- f.cut
df$color <- f.color
df$clarity <- f.clarity
str(df)

summary(df)

df$x[df$x == 0]
df$y[df$y == 0]
df$z[df$z == 0]
df <- df[df$z != 0, ]


summary(df)
max(df$price)
which(df$price == max(df$price))
df[which(df$price == max(df$price)), ]

boxplot(df$x, df$y, df$z)
boxplot(df$carat)
boxplot(df$price)
boxplot(df$depth)

boxplot()
