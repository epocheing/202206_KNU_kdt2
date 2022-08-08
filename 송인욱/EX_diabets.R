df <- read.csv("diabetes.csv", header = T)
str(df)
df <- df[df$Insulin != 0, ]

df$Outcome <- factor(df$Outcome)
barplot(tapply(df$Age, df$Outcome, mean))
barplot(tapply(df$SkinThickness, df$Outcome, mean))
barplot(tapply(df$BMI, df$Outcome, mean))
barplot(tapply(df$DiabetesPedigreeFunction, df$Outcome, mean))
barplot(tapply(df$Glucose, df$Outcome, mean))
df$Outcome <- as.numeric(as.character(df$Outcome))
df$Outcome


# point-biserial correlation coefficient
# 점이연 상관계수
cor.test(df$BMI, df$Outcome)
cor.test(df$Age, df$Outcome)
cor.test(df$SkinThickness, df$Outcome)
cor.test(df$DiabetesPedigreeFunction, df$Outcome)
cor.test(df$Glucose, df$Outcome)
cor.test(df$BloodPressure, df$Outcome)
summary(df$Glucose)

plot(lm(df$Outcome ~ df$Glucose))

mycolor <- ifelse(df$Outcome == 0, "red", "green")
plot(df$Insulin, df$Glucose, col = mycolor, pch = 19, cex = 0.8)
