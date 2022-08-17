library(ggplot2)
library(dplyr)
library(moonBook)

# brain 데이터 불러오기
brain <- read.csv("brain_stroke.csv", header = TRUE)

# 데이터 요약 확인
str(brain)

# 결측치 확인
sum(is.na(brain))

# stroke 비율 확인
prop.table(table(brain$stroke))

# 박스플롯으로 눈으로 차이 확인
# ggplot로 박스플롯 그리기
label <- c("non stroke", "stroke")
brain$stroke <- factor(brain$stroke)

ggplot(data = brain) +
    geom_boxplot(
        mapping = aes(
            x = stroke, y = age, fill = stroke
        ),
        alpha = 0.4, outlier.color = "red"
    ) +
    geom_jitter(aes(x = stroke, y = age, col = stroke), alpha = 0.1) +
    theme_bw()


ggplot(data = brain) +
    geom_boxplot(
        mapping = aes(
            x = stroke, y = avg_glucose_level, fill = stroke
        ),
        alpha = 0.4, outlier.color = "red"
    ) +
    geom_jitter(aes(x = stroke, y = avg_glucose_level, col = stroke), alpha = 0.1) +
    theme_bw()


ggplot(data = brain) +
    geom_boxplot(
        mapping = aes(
            x = stroke, y = bmi, fill = stroke
        ),
        alpha = 0.4, outlier.color = "red"
    ) +
    geom_jitter(aes(x = stroke, y = bmi, col = stroke), alpha = 0.1) +
    theme_bw()


# train data, test data 분류하기
brain.train <- brain
brain.test <- brain




# 로지스틱 회귀분석
model <- glm(stroke ~ ., data = brain.train, family = binomial(link = "logit"))

summary(model)
exp(coef(model))

# backward 방식으로 stepwise logistic regression 수행
# 새로운 모델 정의
reduced.model <- step(model, direction = "backward")
summary(reduced.model)
exp(coef(reduced.model))

# odds ratio 시각화
odds_ratio <- ORtable(reduced.model)
