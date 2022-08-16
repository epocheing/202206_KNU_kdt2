
library('readxl')
sal <- read.csv('./chaebeom/ds_salaries.csv', header = 1)
head(sal)


# 종속변수 : 급여(달러로 환산)
# 독립변수 : 원격 업무 비중, 회사의 규모


# 규모가 큰 집단이 급여의 평균이 높을 것이다




# 직업별 소득은 어떤지 (초반 아이스브레이킹)
# -> 그냥 궁금할 수도 있으니, 급여의 평균
# -> 연도와 직업별 소득


# 독립변수의 선정
cor(sal)

str(sal)
dim(sal)
colnames(sal)

# 고려하지 않을 컬럼 삭제
1. 연도 컬럼 날리기
2. 국가 컬럼 날리기

# 범주형 자료를 factor로 바꾸기
sal$job_title <- factor(sal$job_title)
sal$company_size <- factor(sal$company_size, levels=c('L', 'M', 'S'),
                           labels=c('Large', 'Medium', 'Samll'))
sal$remote_ratio <- factor(sal$remote_ratio, levels=c('0', '50', '100'),
                           labels=c('20%미만', '20%-80%', '80%이상'))

sal$remote_ratio



# 실제 내가 쓸 컬럼은
salary_in_usd, 

experience_level
employment_type
job_title



unique(sal$job_title) # 직업이름 50개가 있네
unique(sal$company_location) # 국가도 50개가 있네
unique(sal$employee_residence) # 국가 50개

unique(sal$company_size) # 이걸 독립변수로 선택

'''
# 
X
work_year
experience_level#
employment_type#
job_title#            # 독립변수

salary
salary_currency#
salary_in_usd          # 종속변수

employee_residence#
remote_ratio          # 독립변수

company_location#
company_size#          # 독립변수

# 통일된 급여를 위해, 해당 연도의 평균 USD 환율로 나눈 값
'''


# 수치로 된 데이터
salary_in_usd
remote_ratio

#------------------------------------------------------------------------------
# 수치로 된 데이터 종속변수에 대한 정규성 검사

# 정규분포를 따른다고는 말할 수는 없음
hist(sqrt(sal$salary_in_usd))


ln

#
library('car')
ggplot(sal$salary_in_usd, pch=19, col='lightgreen')


aov(salary_in_usd ~ company_size, data=sal)


# 각각 회사규모마다의 정규성 테스트도 해보자

# 샤피로 테스트
shapiro.test(sal$salary_in_usd)
shapiro.test(log(sal$salary_in_usd))
shapiro.test(sqrt(sal$salary_in_usd))


sal_usd<- scale(sal$salary_in_usd, center=TRUE, scale=TRUE)

library(MASS)
(sal$salary_in_usd)

shapiro.test(sal$salary_in_usd[sample(1:607, size=500)])
# => 샘플링 여부를 떠나, 정규분포와는 큰 차이가 있다

# Q-Q플롯 -> 가능한 직선으로 일치해야 적합한 모델
qqnorm(sal$salary_in_usd[sample(1:607, size=500)], col='tan1')
qqline(sal$salary_in_usd[sample(1:607, size=500)], col='red', lwd=3)

qqnorm(sqrt(sal$salary_in_usd), col='tan1')
qqline(sqrt(sal$salary_in_usd), col='red', lwd=3)
# 어느정도 정규성을 따른다고 볼 수 있음

shapiro.test(sqrt(sal$salary_in_usd))



# Anderson-Darling 검정
install.packages('nortest')
library(nortest)
ad.test(sal$salary_in_usd)
# 정규분포와는 큰 차이가 있음
#------------------------------------------------------------------------------

leveneTest(salary_in_usd ~ company_size, data=sal, )

oneway.test(salary_in_usd ~ company_size, data=sal, var.equal = TRUE)

plot()

#------------------------------------------------------------------------------

# 분산분석(ANOVA)

tapply(sal$company_size, INDEX=list(SIZE=sal$company_size), mean)


str(sal)
sal$company_size <- factor(sal$company_size, levels=c('L', 'M', 'S'),
                           labels=c('Large', 'Medium', 'Samll'))
sal[seq(1,607,5),]

with(sal, tapply(salary_in_usd, list(company_size, remote_ratio), length))

with(sal, tapply(salary_in_usd, list(company_size, remote_ratio), mean))

with(sal, tapply(salary_in_usd, list(company_size, remote_ratio), sd))


# 이원분산분석 : aov() 함수 이용
sal.aov <- aov(salary_in_usd ~ company_size*remote_ratio, data=sal)

model <- aov(salary_in_usd ~ company_size+remote_ratio+company_size:remote_ratio, data=sal)

summary(sal.aov)


summary(model)
# company_size:remote_ratio 의 p-value가 0.05보다 크다
# -> 규모와 원격비율 각각은 급여의 차이에 영향을 미치고 있으나,
# -> 두개간의 영향관계가 없다는 말

#-------------------------------------------------------------------------------
interaction.plot(sal$company_size, sal$remote_ratio, sal$salary_in_usd, bty='l')

model.tables(model, type='means')

boxplot(salary_in_usd ~ company_size*remote_ratio, data=sal,
        col=c('lightgreen', 'tan1'), las=1,
        xlab='company_size', ylab='remote_ratio',
        main='Wow! Rock & Roll!!!')


* 상호작용이 없어야 good이지영


# ----------------------------------------------------------------------

# 사후검정
원격업무비율
회사사이즈
각각에 대한 사후검정을 실시해줘라






