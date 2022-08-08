df <- read.csv("diabetes.csv", header = T)
str(df)
df <- df[df$Insulin != 0, ]
df

df$Outcome <- factor(df$Outcome)

barplot(tapply(df$Age, df$Outcome, mean))

barplot(tapply(df$SkinThickness, df$Outcome, mean))

barplot(tapply(df$BMI, df$Outcome, mean))

barplot(tapply(df$DiabetesPedigreeFunction, df$Outcome, mean))
