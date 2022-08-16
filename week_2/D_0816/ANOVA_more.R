library(faraway)

sexab.aov <- aov(ptsd ~ cpa + csa, data = sexab)
summary(sexab.aov)

library(heplots)
str(Skulls)
