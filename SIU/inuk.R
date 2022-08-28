a <- read.csv("./산림면적.csv", header = TRUE)
b <- read.csv("./멸종위기적색지수.csv", header = TRUE)

c <- merge(a, b)

str(c)

c <- c[order(c$시점), ]

write.csv(c, "산림면적+적색지수.csv")
