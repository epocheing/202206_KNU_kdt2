# R dataframe
df <- iris
str(df)
class(df)
dim(df)
nrow(df)
ncol(df)
head(df)

rownames(df)
colnames(df)

v <- c(85, 77, 96)
v

names(v)
names(v) <- c('Kor', 'Eng', 'Math')
names(v)
v

v["Kor"]
v[c("Eng", "Math")]

# 새로운 데이터프레임 만들고 조건을 준 후 그래프 그리기
df$Sepal.Length
df$Sepal.Width

df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width
df$Sepal.Sum

df$Sepal.Sep <- ifelse(df$Sepal.Sum > mean(df$Sepal.Sum), "Big", "Small")

str(df)

df$Sepal.Sep <- factor(df$Sepal.Sep)
str(df)
levels(df$Sepal.Sep)
ss <- table(df$Sepal.Sep)
barplot(ss)


# 미국 주 데이터
?state.x77
class(state.x77)
is.data.frame(state.x77)
st <- as.data.frame(state.x77)
str(st)
dim(st)
head(st)

rownames(st)

