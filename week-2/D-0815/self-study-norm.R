# 이항분포: binom
# 정규분포: norm
# t분포: t
# f분포: f
# x^2분포: chisq
# 일양분포: unif

# 확률 밀도 함수: d, density
# 확률 분포 함수: p, probablity
# 백분위수 생성 함수: q, quantile
# 난수 생성 함수: r, random

# 이항분포 관련 함수
dbinom(7, size = 10, prob = 0.5)

pbinom(7, size = 10, prob = 0.5)
dbinom(0:7, size = 10, prob = 0.5)
sum(dbinom(0:7, size = 10, prob = 0.5))
pbinom(7, size = 10, prob = 0.5, lower.tail = FALSE)
pbinom(7, size = 10, prob = 0.5) - pbinom(3, size = 10, prob = 0.5)

pbinom(c(3, 7), size = 10, prob = 0.5)
diff(pbinom(c(3, 7), size = 10, prob = 0.5))

set.seed(1)
rbinom(1, size = 10, prob = 0.5)
rbinom(5, size = 10, prob = 0.5)

# 정규분포 관련 함수
pnorm(110, mean = 100, sd = 10)
pnorm(110, mean = 100, sd = 10, lower.tail = FALSE)
pnorm(0)
pnorm(0, mean = 0, sd = 1)

pnorm(110, mean = 100, sd = 10) - pnorm(90, mean = 100, sd = 10)
diff(pnorm(c(90, 110), mean = 100, sd = 10))

qnorm(0.05, mean = 100, sd = 10)
qnorm(0.95, mean = 100, sd = 10)

qnorm(c(0.05, 0.95), mean = 100, sd = 10)
qnorm(0.025)
qnorm(0.975)
qnorm(c(0.025, 0.975))

rnorm(1, mean = 100, sd = 10)
rnorm(5, mean = 100, sd = 10)
rnorm(1)
rnorm(5)
rnorm(3, mean = c(-10, 0, 10), sd = 1)
rnorm(6, mean = c(-10, 0, 10), sd = 1)

# 정규성테스트
set.seed(123)
shapiro.test(rnorm(100, mean = 100, sd = 10))
shapiro.test(runif(100, min = 2, max = 4))

# 데이터의 정규성 그래프
# qq 도표
set.seed(123)
qqnorm(rnorm(100, mean = 100, sd = 10), col = "blue", main = "Sample")
qqline(rnorm(100, mean = 100, sd = 10), col = "red")

qqnorm(runif(100, min = 2, max = 4), col = "blue", main = "Sample")
qqline(runif(100, min = 2, max = 4), col = "red")
