# 벡터
v <- c(10,20,30,40,50,60,70)

v[1]
v[1:5]
v[2:3]  
v[c(-1,-3,-5)]
v[c(T,T,F,F,F,T,F)]
v + 1
v > 30
v[v > 30]

rep(1:3, times = 3)

v
v[c(T,F)]

# 1에서 100까지 수 중에서 7의 배수의 합은?
v <- 1:100
sum(v[c(F,F,F,F,F,F,T)])
sum(v[v %% 7 == 0])
sum(seq(7,100,7))


# 백터 생성
v <- c()
for (i in 1:10) {
  v <- c(v,i)
}
v

v <- c()
for (i in 1:10) {
  v[i] <- i
}
v

v <- c(10,20,30)
v

v[7] <- 70
v

# 펙터
f <- factor(c(1, 2, 1, 2),
            levels = 1:3,
            lavels = c("Male", "Female", "TG"))
levels(f)

f[1]
f[2]
f[f="Male"]
f[f="Female"]
f[6] <- "Male"
f

f[7] <- "TG"
f

v.1 <- c(1,2,3)
v.2 <- c("F", "F", "M")
c(v.1, v.2)

# 리스트
lst <- list(id = v.1, gender = v.2)
lst

lst$id
lst$gender

# 행렬: matrix
# 행과 열의 2차원을 가진 벡터
# 나중에 배운다

# which 함수
v <- c(10,20,30,40,50)
ww = which(v>30)
v[ww]


# n의 약수를 모두 출력하시오
# 반복문은 사용하지 마시오.
n <- 32


str(iris)
View(iris)
iris[1:5,1:5]


# Petal.Lenth가 평균보다 큰 데이터의
# Petal.Width 평균값은 얼마인가?
mean(iris[iris$Petal.Length > mean(iris$Petal.Length),
          "Petal.Width"])


fun <- function(x) {
  return (x+y+5)
}
y <- 3
fun(5)


divisor <- function(n) {
  v <- 1:n
  x <- v[n %% v ==0]
  return(x)
}

divisor(32)

div.cnt <- function(n) length((1:n)[n %% (1:n) == 0])
div.cnt(15)


f1 <- function(n) n^2
f1(n=5)

# sapply: 파이썬 apply같은데 좀더 편한 느낌
sapply(1:9, FUN = f1)

(1:100)[sapply(1:100, FUN = div.cnt) == 2]
