pnorm(35000, 30000, 10000) - pnorm(25000, 30000, 10000)

pnorm(1, 0, 1) - pnorm(-1, 0, 1)

pnorm(2) - pnorm(-2)
pnorm(2.56) - pnorm(-2.56)

(1 - pnorm(87, mean = 68, sd = 10)) * 200

pnorm(87, mean = 68, sd = 10, lower.tail = FALSE)

pnorm(25000, 30000, 10000)
pnorm(35000, 30000, 10000, lower.tail = FALSE)

pnorm(70, 60, 10, lower.tail = FALSE)
pnorm(80, 70, 20, lower.tail = FALSE)

x <- rbinom(1000000, size = 100, prob = 0.5)
hist(x, col = "skyblue", breaks = 20, prob = TRUE)
sd(x)
curve(dnorm(x, 50, 5), 30, 70, col = "tomato", add = TRUE, lwd = 3, lty = 2)


library(MASS)
survey <- survey
height <- na.omit(survey$Height)
length(height)
hist(height, col = "skyblue", breaks = 20)
mean(height)
sd(height)

X.bar <- c()
for (i in 1:100000) {
    samp <- height[sample(1:209, size = 30)]
    X.bar[i] <- mean(samp)
    X.st[i] <- sd(samp)
}

hist(X.bar, col = "skyblue", breaks = 20, prob = TRUE)
x <- seq(160, 180, lenght = 200)
curve(dnorm(x, mean(height), sd(X.bar)), 160, 180, col = "tomato", add = TRUE, lwd = 3, lty = 2)

x.1 <- rnorm(n = 5000, mean = 70, sd = 5)
x.2 <- rnorm(n = 5000, mean = 50, sd = 5)
x <- c(x.1, x.2)
hist(x, col = "skyblue", breaks = 20)

X.bar <- c()
for (i in 1:10000) {
    samp <- height[sample(x, size = 30)]
    X.bar[i] <- mean(samp)
}

hist(X.bar, col = "skyblue", breaks = 20, prob = TRUE)
x.samp <- seq(30, 90, lenght = 200)
# curve(dnorm(x.samp, mean(x), sd(X.bar)), 30, 90, col = "tomato", add = TRUE, lwd = 3, lty = 2)

iris <- iris
cor(iris[, -5])


binom.test(x = 60, n = 100, p = 0.5)

qnorm(p = 0.5, mean = 50, sd = 10)
qnorm(p = 0.68, mean = 50, sd = 10)
qnorm(p = 0.975, mean = 50, sd = 10)
qnorm(p = 0.025, mean = 50, sd = 10)
qnorm(p = 0.005, mean = 50, sd = 10)
qnorm(p = 0.995, mean = 50, sd = 10)

pnorm(75.75829, mean = 50, sd = 10)
pnorm(24.24171, mean = 50, sd = 10)


binom.test(x = 65, n = 100, p = 0.5, conf.level = 0.99)

binom.test(60, 100, 0.5, alternative = "greater")


shapiro.test(survey$Height)
hist(survey$Height, col = "lightgreen")

shapiro.test(survey$Age)
shapiro.test(iris$Petal.Length)
shapiro.test(mtcars$mpg)

qqnorm(survey$Height, col = "skyblue")
qqline(survey$Height, col = "tomato", lwd = 5)

qqnorm(survey$Age, col = "skyblue")
qqline(survey$Age, col = "tomato", lwd = 5)

v <- rt(n = 10000, df = 29)
hist(v, col = "lightgreen", prob = TRUE)

x <- seq(-4, 4, length = 200)
curve(dt(x, df = 29), -4, 4, add = TRUE, col = "tomato", lwd = 2, lty = 2)
curve(dnorm(x), -4, 4, add = TRUE, col = "violet", lwd = 5, lty = 4)

pt(q = 0.975, df = 29)

data(cats)
str(cats)

table(cats$Sex)
mean(cats$Bwt, na.rm = TRUE)
tapply(cats$Bwt, list(cats$Sex), mean)

t.test(Bwt ~ Sex, data = cats, conf.level = 0.99)

str(sleep)
data(sleep)

t.test(extra ~ group, data = sleep, paired = TRUE)
