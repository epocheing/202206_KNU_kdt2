install.packages("corrplot")
library(corrplot)

stroke <- read.csv("brain_stroke.csv", header = TRUE)
str(stroke)

cor(stroke)
