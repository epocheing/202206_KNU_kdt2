library(dplyr)

a <- read.csv("로드킬2021.csv", header = TRUE)
b <- read.csv("생태통로.csv", header = TRUE)

c <- full_join(a, b, by = "경도")

c$위도 <- c$위도.x + c$위도.y

write.csv(c, "합체.csv")
