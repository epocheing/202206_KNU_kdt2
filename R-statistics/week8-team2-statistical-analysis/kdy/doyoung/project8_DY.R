getwd()

# sbp : 수축기 혈압
# tobacco : 누적 담배(kg)
# ldl : 저밀도 지단백 콜레스테롤
# adiposity : 비만도 숫자형 벡터
# famhist : "부재" 및 "현재" 수준의 요인인 심장 질환의 가족력
# typea : A형 유형
# obesity : 비만 수치 벡터
# alcohol : 현재 알코올 소비
# age : 발병 연령
# chd : 반응, 관상 동맥 심장 질환

# 데이터 로딩
DF <- read.csv('./doyoung/Data/cardiovascular.txt', sep=';')
df <- DF[, -1]

# 속성 확인?
str(df)

# 상위 데이터 확인
head(df, 10)

# 결측치 확인
sum(is.na(df))


# 기술통계 확인
summary(df)


# 범주형으로 형변환
unique(df$famhist)
df$famhist <- factor(df$famhist,
                     levels = c('Present', 'Absent'),
                     labels = c('유전', '유전X'))
df$chd <- factor(df$chd, 
                 levels = c(1, 0), 
                 labels = c('발병', '미발병'))
str(df)

# • 카이스퀘어 검정: chi-square test
# • 교차표상의 응답 빈도를 바탕으로 범주형 변수 간의 관련성 검정
# 카이스퀘어 분석을 위한 교차표 만들기
tabX <- table(df[, c(5, 10)])

#  발병률 차이가 있는지 확인하기 위한 독립성 검정
chisq.test(tabX)  # 매우 작으므로 귀무가설 기각, 대립가설 채택 즉, 발병률 차이가 있다.

# 두 범주형 변수 간의 관련성의 강도를 평가하기
library(vcd)
assocstats(tabX)

# 두 범주형 변수 간의 관계를 모자이크 플롯으로 시각화하기
mosaic(tabX, shade=T, legend = T)

#####################################
# df$famhist <- factor(df$famhist)
# df$chd <- factor(df$chd)
# 
# with(df, chisq.test(chd, famhist))
# 
# mosaic(~ chd + famhist, data = df,
#        shade = T, legend = T)
##################################

# df 데이터셋의 변수 간 상관관계와 산점도 행렬 그래프
str(df)
cor(df[, -c(5, 10)])
 
# 그래프 1
library(psych)
pairs.panels(df[, -c(5, 10)],
             bg='red',
             pch=21,
             hist.col = 'gold')

# 그래프 2 
library(corrgram)
corrgram(df[, -c(5, 10)],
         order = T,
         lower.panel = panel.shade,
         upper.panel = panel.pie,
         text.panel = panel.txt)

# 그래프 3
library(corrgram)
cols <- colorRampPalette(c('darkgoldenrod4', 'burlywood1', 'darkkhaki', 'darkgreen'))
corrgram(df[, -c(5, 10)],
         order = F,
         col.regions=cols,
         lower.panel=panel.pie,
         upper.panel=panel.conf,
         text.panel=panel.txt)

#######################################
# # 다중 선형 회귀?
# 
# # 모든 변수 산포도 그래프? 
# plot(df[, -c(5, 10)], pch = 19, col = 'steelblue')
# 
# library(car)
# library(sm)
# scatterplotMatrix(df[, -c(5, 10)], pch = 19, col = 'steelblue', cex = 1.2,
#                   regLine = list(method = lm, lwd = 2, col = 'tomato'),
#                   smooth = list(smoother = loessLine, spread = F,
#                                 lwd.smooth = 2, col.smooth = 'orange'))
# 
# # lm() 함수와 formula
# formula = chd ~ .
# df$chd <- as.numeric(df$chd)
# model <- lm(formula, data = df[, -5])
# summary(model)
# 
# # df 데이터셋에서 후진선택법으로 회귀모델 구축
# df.lm <- lm(chd ~ ., data = df[, -5])
# step(df.lm, direction = 'backward')

###############################################
# 선형회귀분석을 위한 조건에 맞지 않는 경우:
#   - 결과변수가 범주형 변수일 때: 로지스틱 회귀분석


# ▪ 일반화 선형모델: generalized linear model
# • 로지스틱 회귀분석: logistic regression analysis
# - 결과변수가 범주형 변수일 때: 정규분포를 따르지 않음
# • 이분 변수(binary variable): 예/아니오, 성공/실패, 생존/사망 등

# 이항 로지스틱 회귀분석: binomial logistic regression analysis
df <- DF
str(df)
# ind는 분석에서 제외
df <- df[,-1]
# famhist 범주로 변환
df$famhist <- factor(ifelse(df$famhist == 'Absent', 1, 2),
                     levels=c(1, 2), labels = c('유전x', '유전'))
df$chd <- factor(ifelse(df$chd == 0, 1, 2),
                 levels = c(1, 2), labels = c('미발병', '발병'))
str(df)
levels(df$chd)

# 테이블확인
table(df$famhist)
table(df$chd)
prop.table(table(df$famhist))
prop.table(table(df$chd))

# glm()함수를 이용하여 로지스틱 회귀분석 수행
df.logit <- glm(chd ~ ., data = df, family = binomial(link='logit'))
summary(df.logit)

# 오즈비로 발병률 확인: famhist 값이 1 증가하면 발병률이 약 2.5배 증가
coef(df.logit)
exp(coef(df.logit))

####################################################
# # 로지스틱 회귀를 이용한 발병률 예측
# library(modeldata)
# 
# # predict() 함수 이용: 학습한 모델을 바탕으로 예측을 수행
# df.test <- df[,-10]
# str(df)
# df.logit.pred <- predict(df.logit, newdata = df, type = 'response')
# head(df.logit.pred)
# # 
# # # 분류(classification): 계산된 예측확률로 발병과 미발병으로 분류
# df.logit.pred <- factor(df.logit.pred > 0.5,
#                         levels = c(F, T), labels=c('no', 'yes'))
# head(df.logit.pred)
# 
# table(df.logit.pred)
# # 
# # # 예측 결과의 비교: 혼동 행렬(confusion matrix)
# table(df$chd, df.logit.pred, dnn=c('Actual', 'predicted'))
# mean(df$chd==df.logit.pred)
###############################################################
df$pred <- factor(ifelse(df.logit$fitted.values > 0.45,
                         'Yes', 'No'))

tab <- table(df$chd, df$pred)
tab

TP <- tab[2, 2]
TN <- tab[1, 1]
FP <- tab[1, 2]
FN <- tab[2, 1]

accuracy <- (TP + TN) / (TP + TN + FP +FN) # 정확도
precision <- TP / (TP + FP) # 정밀도
recall <- TP / (TP + FN) # 재현율
F1.score <- (2 * precision * recall) / (precision + recall) # 정밀도와 재현율의 조화평균

library(pROC)
roc(chd ~ df.logit$fitted.values, data = df,
    plot = T, col = 'tomato')

rownames(tabX)


df.logit$coefficients

barplot(tabX, las=1, 
        col = c('yellowgreen', 'lightsalmon'),
        main = 'Frequency of tabX')
legend(0.2, 300, rownames(tabX),
       fill = c('yellowgreen', 'lightsalmon'))

# 최적의 임계점 찾기
library(mlbench)
df$pred <- as.numeric(df$pred)
df$chd <- as.numeric(df$chd)
df$pred <- ifelse(df$pred == 1, df$pred <- 0, df$pred <- 1)
df$chd <- ifelse(df$chd==1, df$chd <- 0, df$chd <- 1)
plot.roc(df$pred, df$chd, print.thres=T)

tabX
#  오분류표?
library(caret)
df$pred <- factor(df$pred)
df$chd <- factor(df$chd)
confusionMatrix(df$pred, df$chd)
# 
# df$pred <- as.character(df$pred)
# df$chd <- as.character(df$chd)
# 

# 

# df$pred <- as.numeric(df$pred)
# df$chd <- as.numeric(df$pred)
# 
# class(df$pred)
# class(df$chd)
# 
# df$chd <- factor(df$chd)
# df$pred
# df$pred <- as.numeric(df$pred, levels = c('No', 'Yes'),
#                       labels = c(0, 1))
# df$chd
# df$pred <- as.character(df$pred)
# 
# levels(df$pred)
# levels(df$chd)
# tab
# 
# # 최적의 임계점 찾기
# library(mlbench)
# df$pred <- as.numeric(df$pred)
# df$chd <- as.numeric(df$pred)
# df$pred <- ifelse(df$pred == 1, df$pred <- 0, df$pred <- 1)
# df$chd <- ifelse(df$chd==1, df$chd <- 0, df$chd <- 1)
# plot.roc(df$pred, df$chd, print.thres=T)
