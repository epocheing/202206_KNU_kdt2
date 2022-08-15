# t 분포
# pt = t 값으로 p 값 계산
pt(3.58, df = 20 - 1, lower.tail = FALSE)
pt(3.58, df = 20 - 1, lower.tail = FALSE) * 2
# qt = p 값으로 t 값 계산
qt(0.025, df = 20 - 1, lower.tail = FALSE)

# 일표본 평균검정 (one-sample t test)
# 표본 하나를 모집단과 비교할 때
library(MASS)
data(cats)
str(cats)
# 고양이의 몸무게가 2.6kg 정도라고 가정
t.test(x = cats$Bwt, mu = 2.6)
t.test(x = cats$Bwt, mu = 2.7)
# t.test 함수는 리스트 형태
t.test(x = cats$Bwt, mu = 2.6, alternative = "greater")
cats.t <- t.test(x = cats$Bwt, mu = 2.6)
str(cats.t)
cats.t$p.value
cats.t$conf.int
t.test(x = cats$Bwt, mu = 2.6, conf.level = 0.99)
# 모집단 비율에 대한 검정
prop.test(x = 18, n = 30, p = 0.5, alternative = "greater")


# 독립표본 평균검정 (two-sample t test)
t.test(formula = Bwt ~ Sex, data = cats)
Bwt.f <- cats$Bwt[cats$Sex == "F"]
Bwt.m <- cats$Bwt[cats$Sex == "M"]
mean(Bwt.f)
mean(Bwt.m)
t.test(Bwt.f, Bwt.m)
patients <- c(86, 93, 136, 82)
smokers <- c(83, 90, 129, 70)
prop.test(x = smokers, n = patients)

# 대응표본 평균검정
data(sleep)
str(sleep)
sleep
# paired = TRUE 옵션을 줘야함
t.test(extra ~ group, data = sleep, paired = TRUE)
# wide set으로 변경
library(tidyr)
sleep.wide <- spread(sleep, key = group, value = extra)
sleep.wide
t.test(sleep.wide$"1", sleep.wide$"2", paired = TRUE)
