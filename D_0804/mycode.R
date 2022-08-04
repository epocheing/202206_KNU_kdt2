# r 변수 설정
3+4
print('hello world')

x <- 3
5 -> y
x+y

x <- 5
y <- 10
z <- x+y

# r 라이브러리 설치
library(cowsay)
install.packages('cowsay')

say('Hello, World!')
say('Hello, Chicken', by = 'chicken')

install.packages('ggplot2')

getwd()

# iris 데이터로 연습
plot(iris)
?iris

View(iris)

str(iris)

head(iris)
tail(iris)

class(iris$Species)

levels(iris$Species)

table(iris$Species)

barplot(table(iris$Species))

hist(iris$Petal.Length, col = 'steelblue',
     main = '꽃잎의 길이에 대한 히스토그램',
     xlab = '꽃잎의 길이',
     ylab = '빈도수')

plot(mtcars$mpg, mtcars$wt, col='tomato')

str(cars)
?cars

plot(cars$speed, cars$dist,
     col = 'tomato',
     pch = 19)

str(iris)
mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
hist(iris$Petal.Length, col="tomato",
     breaks = 5)






