setwd('C:/Aravis/teamproject/10주차_태블로/')
getwd()

library(readxl)
library(dplyr)
library(tidyverse)
library(lubridate)
  
# ----------------------------------------------------------------------------------------------
df <- read_excel('./temp_Data/count_by_spec_region.xlsx')

head(df)

df_2016 <- select(df, c('지역(1)','지역(2)', '2016'))
colnames(df_2016) <- c('지역(1)','지역(2)', '발생횟수')
df_2016$'연도' <- 2016
df_2016

DF <- data.frame(matrix(ncol=4))
colnames(DF)<- c('지역(1)', '지역(2)', '발생횟수', '연도')
str(DF)

yr <- c('2016', '2017', '2018', '2019', '2020')

for(i in yr) {
  df_yr <- select(df, c('지역(1)','지역(2)', i))
  colnames(df_yr) <- c('지역(1)','지역(2)', '발생횟수')
  df_yr$'연도' <- as.integer(i)
  DF <- rbind(DF, df_yr)
}
DF
dim(DF)
DFdn <- drop_na(DF)
dim(DFdn)
write.csv(DFdn,file="C:/Aravis/teamproject/10주차_태블로/Data/count_by_spec_region.csv",
          fileEncoding = 'CP949',
          row.names = F)

# ----------------------------------------------------------------------------------------------

df <- read_excel('./temp_Data/monthly_count.xlsx')

df
colnames(df)

DF <- data.frame(matrix(ncol=3))
colnames(DF)<- c('발생월','발생횟수', '연도')
str(DF)

yr <- c('2016년', '2017년', '2018년', '2019년', '2020년')

for(i in yr) {
  print(i)
  df_yr <- select(df, c('발생월', i))
  colnames(df_yr) <- c('발생월', '발생횟수')
  df_yr$'연도' <- i
  DF <- rbind(DF, df_yr)
}
DF
DF <- drop_na(DF)
write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/monthly_count.csv",
          fileEncoding = 'CP949',
          row.names = F)

# ----------------------------------------------------------------------------------------------


df <- read_excel('./temp_Data/지역별_비품종견.xlsx')

df
colnames(df)

DF <- data.frame(matrix(ncol=3))
colnames(DF)<- c('지역','발생횟수', '날짜')
str(DF)

yr <- c(colnames(df))
yr <- yr[2:61]

for(i in yr) {
  print(i)
  df_yr <- select(df, c('구분', i))
  colnames(df_yr) <- c('지역', '발생횟수')
  df_yr$'날짜' <- i
  DF <- rbind(DF, df_yr)
}

DF
DF <- drop_na(DF)
DF$날짜 <- as.Date(as.numeric(as.character(DF$날짜)), origin="1899-12-30")

DF$year <- year(DF$날짜) 
DF$month <- month(DF$날짜)



write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/비품종견_지역별.csv",
          fileEncoding = 'CP949',
          row.names = F)
          
# ----------------------------------------------------------------------------------------------
df <- read_excel('./temp_Data/지역별_품종견.xlsx')

df
colnames(df)

DF <- data.frame(matrix(ncol=3))
colnames(DF)<- c('지역','발생횟수', '날짜')
str(DF)

yr <- c(colnames(df))
yr <- yr[2:61]

for(i in yr) {
  print(i)
  df_yr <- select(df, c('구분', i))
  colnames(df_yr) <- c('지역', '발생횟수')
  df_yr$'날짜' <- i
  DF <- rbind(DF, df_yr)
}

DF
DF <- drop_na(DF)
DF$날짜 <- as.Date(as.numeric(as.character(DF$날짜)), origin="1899-12-30")

DF$year <- year(DF$날짜) 
DF$month <- month(DF$날짜)



write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/품종견_지역별.csv",
          fileEncoding = 'CP949',
          row.names = F)

# ----------------------------------------------------------------------------------------------

df1 <- read.csv('./Data/비품종견_지역별.csv', fileEncoding = "CP949")
df2 <- read.csv('./Data/품종견_지역별.csv', fileEncoding = "CP949")


DF <- df1


DF$발생횟수 <- df1$발생횟수 + df2$발생횟수
head(DF,1)
head(df1,1)
head(df2,1)

DF$비품종견 <- df1$발생횟수
DF$품종견 <- df2$발생횟수

DF

write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/품종견+비품종견_지역별.csv",
          fileEncoding = 'CP949',
          row.names = F)

# ----------------------------------------------------------------------------------------------
df <- as.data.frame(read_excel('./temp_Data/인구대비.xlsx'))

df
colnames(df)[1] <- '지역'
colnames(df)


DF <- data.frame(matrix(ncol=3))
colnames(DF) <- c('지역', '인구대비', '연도')

yr <- c(colnames(df))
yr
yr <- yr[2:6]

for(i in yr) {
  print(i)
  df_yr <- select(df, c('지역', i))
  colnames(df_yr) <- c('지역', '인구대비')
  df_yr$'연도' <- i
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/인구대비.csv",
          fileEncoding = 'CP949',
          row.names = F)


# ----------------------------------------------------------------------------------------------

df <- as.data.frame(read.csv('./temp_Data/월별_관광여행_일수_20220829103651.csv', fileEncoding = 'CP949', header = F, skip = 2))

df
colnames(df) <- c('월','2018', '2019','2020')
colnames(df)


DF <- data.frame(matrix(ncol=3))
colnames(DF) <- c('월', '여행횟수', '연도')


yr <- c(colnames(df))
yr <- yr[2:4]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df, c('월', i))
  colnames(df_yr) <- c('월', '여행횟수')
  df_yr$'연도' <- i
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/여행횟수.csv",
          fileEncoding = 'CP949',
          row.names = F)


# ----------------------------------------------------------------------------------------------


df0 <- read_xlsx('./temp_Data/yr_0세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)


DF <- data.frame(matrix(ncol=4))
colnames(DF) <- c('월','건수','연도', '나이')
DF

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 0
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/1세.xlsx')
df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 1
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/2세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 2
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/3세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 3
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/3세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 3
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/4세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 4
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/5세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 5
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF


# -----

df0 <- read_xlsx('./temp_Data/6-10세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 6
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/11-15세.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 11
  DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF

# -----

df0 <- read_xlsx('./temp_Data/16세_이상.xlsx')

df0
colnames(df0) <- c('월','2016','2017','2018', '2019','2020')
colnames(df0)

yr <- c(colnames(df0))
yr <- yr[2:6]
yr

for(i in yr) {
  print(i)
  df_yr <- select(df0, c('월', i))
  colnames(df_yr) <- c('월', '건수')
  df_yr$'연도' <- i
  df_yr$'나이' <- 16
    DF <- rbind(DF, df_yr)
}

DF <- drop_na(DF)
DF




write.csv(DF,file="C:/Aravis/teamproject/10주차_태블로/Data/dog_yr.csv",
          fileEncoding = 'CP949',
          row.names = F)
