# 결측치
x <- c(45, NA, 87, 63, 55, NA, 72, 61, 59, 68)
is.na(x)
x[is.na(x)]

?airquality

aq <- airquality
str(aq)

ozone <- aq$Ozone
ozone[is.na(ozone)] <- mean(ozone, na.rm = 1)
ozone

complete.cases(aq)
aq[!complete.cases(aq), ]
aq <- aq[complete.cases(aq), ]
aq

library(VIM)
??aggr


# 이상치
st <- data.frame(state.x77)
boxplot(st$Income,
        col = "tomato",
        pch = 19,
        border = "red"
)

class(boxplot.stats(st$Income))
boxplot.stats(st$Income)

st[st$Income == boxplot.stats(st$Income)$out, ]

boxplot(Petal.Width ~ Species,
        data = iris, pch = 19,
        col = "lightgreen", bodere = "brown"
)
