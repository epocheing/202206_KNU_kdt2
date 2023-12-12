### R 과 Rstudio
print("hello, R!")

x <- 10
x
y <- 20
y
z <- x + y
z

### 내장 데이터셋

## iris = 꽃잎 데이터
str(iris)
head(iris)
tail(iris)

## iris$Species 확인
class(iris$Species)
levels(iris$Species)
table(iris$Species)

barplot(table(iris$Species))

## iris#Petal.Length 확인
class(iris$Petal.Length)
mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
hist(iris$Petal.Length,
     col = "steelblue",
     main = "꽃잎의 길이에 대한 히스토그램",
     xlab = "꽃잎의 길이",
     ylab = "빈도수"
)

## mtcar: 자동차 모델 연비
?mtcars
str(mtcars)
mtcars$mpg
mtcars$wt
summary(mtcars)

hist(mtcars$mpg, col = "steelblue")
hist(mtcars$wt,
     col = "orange",
     xlim = c(1, 6),
     ylim = c(0, 10)
)

plot(mtcars$mpg, mtcars$wt)
plot(mtcars$mpg, mtcars$wt, col = "tomato", pch = 19)

# 연습문제 2.1
str(iris)
barplot(table(iris$Species), col = "tomato", xlab = "품종", ylab = "개수", main = "품종의 막대그래프")

# 연습문제 2.2
mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)

hist(iris$Petal.Width, col = "tomato", xlab = "꽃잎의 너비", ylab = "빈도수", main = "꽃잎의 너비에 대한 히스토그램")

# 연습문제 2.3
str(mtcars)
mtcars[5:10, ]
