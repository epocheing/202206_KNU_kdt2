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
hist(iris$Petal.Length, col = 'steelblue',
     main = '꽃잎의 길이에 대한 히스토그램',
     xlab = '꽃잎의 길이',
     ylab = '빈도수')
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## mtcar: 자동차 모델 연비
?mtcars
str(mtcars)
mtcars$mpg
mtcars$wt
summary(mtcars)

hist(mtcars$mpg, col = 'steelblue')
hist(mtcars$wt, col = 'orange',
     xlim = c(1, 6),
     ylim = c(0, 10))

