# 펭귄 데이터 설치
library(palmerpenguins)
install.packages("palmerpenguins")

# 펭귄 데이터 가져오기
df <- na.omit(penguins)
df

table(df$species)
prop.table(table(df$species))

table(df$island)
prop.table(table(df$island))

table(df$sex)
prop.table(table(df$sex))

tapply(
    df$species,
    INDEX = list(df$species),
    FUN = length
)


# gmodel 크로스테이블 만들기
library(gmodels)
install.packages("gmodels")
CrossTable(df$island, df$species,
    prop.c = F, prop.chisq = F
)


# psych
library(psych)
install.packages("psych")
describe(df)[, c(2:4, 8:9)]


# aggregate() 함수를 이용하여 범주별 기술통계량 산출
# tapply => aggregate랑 비슷함

aggregate(
    df[, 3:6],
    by = list(species = df$species),
    FUN = mean
)

tapply(df$bill_length_mm,
    INDEX = list(species = df$species),
    FUN = mean
)


# 종별로 박스플롯 그려보기
boxplot(flipper_length_mm ~ species,
    data = df,
    col = 2:4
)

df <- data.frame(df)
adelie <- split(df, df$species)$Adelie
adelie
outlier <- boxplot.stats(adelie$flipper_length_mm)$out
outlier
df[df$flipper_length_mm %in% outlier, ]
dim(df[df$flipper_length_mm %in% outlier, ])


# 날개 길이 기준 오름차, 체질량 내림차 정렬
library(palmerpenguins)
df <- na.omit(penguins)
df <- data.frame(df)

ord <- order(df$flipper_length_mm, -df$body_mass_g)
ord
head(df[ord, ], n = 10)

library(palmerpenguins)
df <- na.omit(penguins)
plot(df$bill_depth_mm ~ df$bill_length_mm)
