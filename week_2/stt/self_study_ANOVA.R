str(InsectSprays)
InsectSprays

tapply(InsectSprays$count, InsectSprays$spray, length)
tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, sd)

library(gplots)
windows(width=12, height=8)
plotmeans(count ~ spray, data = InsectSprays,
          barcol = "tomato", barwidth = 3,
          col = "cornflowerblue", lwd = 2,
          xlab = "Type of Sprays", ylab = "Insect Count",
          main = "Performance of Insect Sprays")

boxplot(count ~ spray, data = InsectSprays, col = "tomato")

sprays.aov <- aov(count ~ spray, data = InsectSprays)
summary(spray.aov)

model.tables(spray.aov, type = "mean")
model.tables(spray.aov, type = "effects")

sprays.compare <- TukeyHSD(sprays.aov)
sprays.compare
str(sprays.compare)
sprays.compare$spray['D-C',]
