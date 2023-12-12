# brain 데이터 불러오기
brain1 <- read.csv("brain_stroke.csv", header = TRUE)
brain2 <- read.csv("brain_stroke_filled.csv", header = TRUE)
brain <- rbind(brain1, brain2)

# EDA -------------------------------------------------------------------
# 데이터 요약 확인
str(brain)
# 결측치 확인
sum(is.na(brain))

# stroke 비율 확인
prop.table(table(brain$stroke))

# 범주형 데이터 factor로 변경
index <- c(1, 3, 4, 5, 6, 7, 10, 11)
brain[, index] <- lapply(brain[, index], factor)
str(brain)


# 박스플롯으로 눈으로 차이 확인
# ggplot로 박스플롯 그리기
library(ggplot2)
library(dplyr)
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

# cdplot
cdplot(stroke ~ age, data = brain)
cdplot(stroke ~ avg_glucose_level, data = brain)
cdplot(stroke ~ bmi, data = brain)

# 모자이크 플롯으로 범주형 ~ 범주형 비교하기
mosaicplot(stroke ~ hypertension, data = brain)
mosaicplot(stroke ~ heart_disease, data = brain)



# -----------------------------------------------------------------------
# 로지스틱 회귀분석 -----------------------------------------------------
# train, test 데이터 나누기
brain.train <- brain[1:4000, ]
brain.test <- brain[4001:5182, ]

# 로지스틱 모델 생성
model <- glm(stroke ~ ., data = brain.train, family = binomial(link = "logit"))
summary(model)
exp(coef(model))

# backward 방식으로 stepwise logistic regression 수행
# 새로운 모델 정의
model <- step(model, direction = "backward")
summary(model)

# odds ratio 구하기
odds.ratio <- exp(coef(model))
odds.ratio

# odds ratio 시각화
library(moonBook)
ORplot(model,
    type = 2, show.OR = FALSE, show.CI = TRUE,
    pch = 15, lwd = 3, col = c("blue", "red")
)

# 예측테스트(임계값 0.5)
probability <- predict(model, brain.train, type = "response")
predict_A <- as.factor(ifelse(probability > 0.5, "1", "0"))

# 혼동행렬
library(caret)
confusionMatrix(predict_A, brain.train$stroke)

# 다중 공선성
library(car)
vif(model)


# ROC Curve를 통해서 최적의 임계값 구하기
library(pROC)
ROC <- roc(brain.train$stroke, probability)
plot.roc(ROC,
    col = "royalblue",
    print.auc = TRUE,
    max.auc.polygon = TRUE,
    print.thres = TRUE, print.thres.pch = 19, print.thres.col = "red",
    auc.polygon = TRUE, auc.polygon.col = "lightblue"
)
predict_B <- as.factor(ifelse(probability > 0.05, "1", "0"))
confusionMatrix(predict_B, brain.train$stroke)


# false positive, true positive 비율로 임계값 구하기
library(ROCR)
library(dplyr)

prediction(probability, brain.train$stroke) %>%
    performance(measure = "tpr", x.measure = "fpr") -> result

plotdata <- data.frame(
    x = result@x.values[[1]],
    y = result@y.values[[1]],
    p = result@alpha.values[[1]]
)

p <- ggplot(data = plotdata) +
    geom_path(aes(x = x, y = y)) +
    xlab(result@x.name) +
    ylab(result@y.name) +
    theme_bw()

dist_vec <- plotdata$x^2 + (1 - plotdata$y)^2
opt_pos <- which.min(dist_vec)

p +
    geom_point(
        data = plotdata[opt_pos, ],
        aes(x = x, y = y), col = "red"
    ) +
    annotate("text",
        x = plotdata[opt_pos, ]$x + 0.1,
        y = plotdata[opt_pos, ]$y,
        label = paste("p =", round(plotdata[opt_pos, ]$p, 3))
    )

min_pos <- which.max(plotdata$y >= 0.85)

p +
    geom_point(
        data = plotdata[plotdata$y >= 0.85, ],
        aes(x = x, y = y), size = 0.2, col = "green"
    ) +
    geom_hline(yintercept = 0.85, linetype = "dashed") +
    geom_point(data = plotdata[min_pos, ], aes(x = x, y = y), col = "red") +
    annotate("text",
        x = plotdata[min_pos, ]$x + 0.07,
        y = plotdata[min_pos, ]$y - 0.02,
        label = paste("p =", round(plotdata[min_pos, ]$p, 3)),
        col = "red"
    ) +
    geom_point(
        data = plotdata[opt_pos, ],
        aes(x = x, y = y), col = "black"
    ) +
    annotate("text",
        x = plotdata[opt_pos, ]$x + 0.05,
        y = plotdata[opt_pos, ]$y - 0.05,
        label = paste("p =", round(plotdata[opt_pos, ]$p, 3))
    )

predict_C <- as.factor(ifelse(probability > 0.049, "1", "0"))
confusionMatrix(predict_C, brain.train$stroke)


# B와 C의 차이 확인
confusionMatrix(predict_B, brain.train$stroke)
confusionMatrix(predict_C, brain.train$stroke)


# test 데이터 예측
probability_test <- predict(model, brain.test, type = "response")
predict_test <- as.factor(ifelse(probability_test > 0.049, "1", "0"))
confusionMatrix(predict_test, brain.test$stroke)
