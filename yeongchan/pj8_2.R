# 목표 :  응답결과에 따른 연령, 교육수준, 나이 관련성

# 25항까지는 설문항목, 26~28항까지는 연령, 교육수준, 나이


library(psychTools)
bfiDF_2nd <- bfi
str(bfiDF_2nd)
bfiDF_omit <- na.omit(bfiDF_2nd)
str(bfiDF_omit)

# O개방성
# C성실성
# E외향성
# A우호성
# N신경증

bfiDF_omit$f_gender <- factor(bfiDF_omit$gender, levels = c(1, 2), labels = c('Males', 'Females'))
bfiDF_omit$f_education <- factor(bfiDF_omit$education)
str(bfiDF_omit)

table(bfiDF_omit$f_gender, bfiDF_omit$f_education)
#           1   2   3   4   5
# Males    82  92 306 120 135
# Females 116 158 772 226 229

chisq.test(table(bfiDF_omit$f_gender, bfiDF_omit$f_education))

# Pearson's Chi-squared test
# 
# data:  table(bfiDF_omit$f_gender, bfiDF_omit$f_education)
# X-squared = 21.573, df = 4, p-value = 0.0002437
# 성별과 교육수준은 관계가 있다.

bfiDF_omit$sum_A <- bfiDF_omit[,1]+bfiDF_omit[,2]+bfiDF_omit[,3]+bfiDF_omit[,4]+bfiDF_omit[,5]
bfiDF_omit$sum_C <- bfiDF_omit[,6]+bfiDF_omit[,7]+bfiDF_omit[,8]+bfiDF_omit[,9]+bfiDF_omit[,10]
bfiDF_omit$sum_E <- bfiDF_omit[,11]+bfiDF_omit[,12]+bfiDF_omit[,13]+bfiDF_omit[,14]+bfiDF_omit[,15]
bfiDF_omit$sum_N <- bfiDF_omit[,16]+bfiDF_omit[,17]+bfiDF_omit[,18]+bfiDF_omit[,19]+bfiDF_omit[,20]
bfiDF_omit$sum_O <- bfiDF_omit[,21]+bfiDF_omit[,22]+bfiDF_omit[,23]+bfiDF_omit[,24]+bfiDF_omit[,25]
# 테이블 막대그래프
str(bfiDF_omit)
str(bfiDF_omit[,29:35])
c(bfiDF_omit[,31])
str(bfiDF_omit[,c(27,31:35)])
library(psych)
??corr.test
corr.test(bfiDF_omit[,c(27,31:35)])
cor(bfiDF_omit$education, bfiDF_omit$sum_A)
cor(bfiDF_omit$education, bfiDF_omit$sum_C)
cor(bfiDF_omit$education, bfiDF_omit$sum_E)
cor(bfiDF_omit$education, bfiDF_omit$sum_N)
cor(bfiDF_omit$education, bfiDF_omit$sum_O)
# 회귀분석x 범주형으로 로지스틱

lm(f_education~sum_A, data=bfiDF_omit)


# 막대그래프, 박스플롯

