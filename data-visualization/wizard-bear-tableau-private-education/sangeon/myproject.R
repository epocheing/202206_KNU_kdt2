part <- read.csv('../MyProject/학교급별.csv', fileEncoding = 'euc-kr')
str(part)
view(part)

ui <- fluidPage(
  headerPanel(
    tags$h1("여기가 헤더임")
  ),
  mainPanel(
    plotOutput('distPlot')
  )
)

part2 <- part[part["항목"] != "일반고 (만원)",]
colnames(part2)[1] <- "year" 
colnames(part2)[2] <- "school"
colnames(part2)[4] <- "pri_exp"
view(part2)
library(tidyverse)
library(gganimate)
library(nord)
library(viridis)
library(av)
library(ggplot2)
library(hrbrthemes)
library(babynames)
library(tsibble)
library(plotly)
library(data.table)
library(MASS)
library(extrafont)
library(fmsb)
??radarchart
# animation bar
ggplot(part2, aes(x=school, y=pri_exp, fill=school)) + 
  geom_bar(stat='identity') +
  theme_bw() +
  transition_states(
    year,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')
)

ggplot(part2, aes(x=year, y=pri_exp, group=school, color=school)) +
  #geom_line(aes(lty = 항목),alpha = 0.6) +
  geom_point(size = 15) +
  scale_color_viridis(discrete = T) +
  geom_text(x=2010, y=30, aes(label=factor(year)), data=part2,size=13,col='red')+
  theme_classic() +
  theme(axis.title=element_text(size=20)) +
  theme(axis.text.x = element_text(size=15),
        axis.text.y = element_text(size =15))+
  transition_time(year)

# 
part3 <- part2[part2["항목"]=="고등학교 (만원)", c(1:2, 6:11)]
part4 <- part2[part2["school"]=="고등학교 (만원)", c(1:2, 18:22)]
part5 <- part2[part2["school"]=="중학교 (만원)", c(1:2, 18:22)]
part6 <- part2[part2["school"]=="초등학교 (만원)", c(1:2, 18:22)]

part_ele_ent <- part2[part2["항목"]=="초등학교 (만원)", c(1:2, 13:16)]
part_ele_sub <- part2[part2["항목"]=="초등학교 (만원)", c(1:2, 6:11)]
part_ele_all <- part2[part2["항목"]=="초등학교 (만원)", c(1:2, 6:11, 13:16)]


# pivot_longer
part_sub <- pivot_longer(
  part3,
  cols = c("국..어","영..어","수..학","사회.과학","논..술","제2외국어.한문.컴퓨터.등"),
  names_to = "과목",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)

part_cate <- pivot_longer(
  part4,
  cols = c("개인과외","그룹과외","학원수강","방문학습지","유료인터넷.및.통신강좌.등"),
  names_to = "유형",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)

part_cate2 <- pivot_longer(
  part5,
  cols = c("개인과외","그룹과외","학원수강","방문학습지","유료인터넷.및.통신강좌.등"),
  names_to = "유형",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)

part_cate3 <- pivot_longer(
  part6,
  cols = c("개인과외","그룹과외","학원수강","방문학습지","유료인터넷.및.통신강좌.등"),
  names_to = "유형",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)



ggplot(part_sub, aes(x=과목, y=사교육비, fill=과목)) + 
  geom_bar(stat='identity') +
  theme_bw() +
  # gganimate specific bits:
  transition_states(
    시점,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')

ggplot(part_sub, aes(x=시점, y=사교육비, group=과목, color=과목)) +
  geom_line()

ggplot(part_sub, aes(x=시점, y=사교육비, group=과목, color=과목)) +
  geom_line(aes(lty = 항목), alpha = 0.6) +
  geom_point() +
  scale_color_viridis(discrete = T) +
  theme_modern_rc() +
  transition_reveal(along = 시점)

# 버블
ggplot(part_cate, aes(x=시점, y=사교육비, color=유형, size=사교육비))+
  geom_point(alpha=0.7)+
  scale_y_log10()+
  scale_size(range=c(3,18))+
  theme_minimal()+
  theme(legend.position='bottom')
# multi bar
ggplot(part_sub, aes(fill=과목, y=사교육비, x=시점)) + 
  geom_bar(position="dodge", stat="identity")
part_cate
part_cate |>
  filter(유형!="방문학습지") |>
  ggplot( aes(fill=유형, y=사교육비, x=year)) +
  ggtitle("2007 ~ 2021 고등학교 유형별 사교육비") +
  geom_bar(position="dodge", stat="identity", width = 0.7) +
  geom_text(aes(label = 사교육비), vjust = 0, color = "white") +
  facet_wrap(scales = 'free', . ~ 유형) +
  theme_ft_rc()

ggplot(part_cate, aes(x=시점,y=사교육비)) + geom_point(aes(colour=유형))





plt <- ggplot(part_cate) +
  # Make custom panel grid
  geom_hline(
    aes(yintercept = y), 
    data.frame(y = c(0:3) * 100),
    color = "lightgrey"
  ) + 
  # Add bars to represent the cumulative track lengths
  # str_wrap(region, 5) wraps the text so each line has at most 5 characters
  # (but it doesn't break long words!)
  geom_col(
    aes(
      x = reorder(str_wrap(유형, 5), 시점),
      y = 사교육비,
      fill = 사교육비
    ),
    position = "dodge2",
    show.legend = TRUE,
    alpha = .9
  ) +
  
  # Add dots to represent the mean gain
  geom_point(
    aes(
      x = reorder(str_wrap(유형, 5),시점),
      y = 사교육비
    ),
    size = 3,
    color = "gray12"
  ) +
  
  # Lollipop shaft for mean gain per region
  geom_segment(
    aes(
      x = reorder(str_wrap(유형, 5), 시점),
      y = 0,
      xend = reorder(str_wrap(유형, 5), 시점),
      yend = 3000
    ),
    linetype = "dashed",
    color = "gray12"
  ) + 
  
  # Make it circular!
  coord_polar()

part_ele_sub <- pivot_longer(
  part_ele_sub,
  cols = c("국..어","영..어","수..학","사회.과학","논..술","제2외국어.한문.컴퓨터.등"),
  names_to = "과목",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)
part_high_all <- part2[part2["school"]=="고등학교 (만원)", c(1:2, 6:11, 13:16)]
part_high_all
colnames(part_high_all) <- c("year","school","국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양")

view(part_high_all)
part_high_all <- pivot_longer(
  part_high_all,
  cols = c("국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양"),
  names_to = "과목",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)
part_high_all


# 파이

part_2007 <- subset(part_high_all, 시점 == 2007)
part_2007 <- part_2007 |>
  arrange(desc(사교육비))
 
part_2007$portion <- (part_2007$사교육비 / sum(part_2007$사교육비))
view(part_2007)
part_2007$rno <- c(1:10)

lb <- part_2007
view(lb)
angle <-  90-(360*(lb$rno-0.5)/nrow(part_2007))
lb$hjust<-ifelse(angle < -90, 1, 0)
lb$angle<-ifelse(angle < -90, angle+180, angle)
color_1 <- c(
             '#c93318','#e36810','#e3ce10','#84e310','#10e36b',
             '#10e3d8','#1084e3','#4510e3','#e310c3','#f03630'
             )
color_1 <- rev(color_1)
ggplot(lb, aes(x=as.factor(rno), y=sqrt(사교육비)*200))+
  geom_bar(stat='identity', fill=color_1)+
  theme_void()+
  coord_polar(start=0)+
  geom_text(data=lb, 
            aes(x=rno, y=sqrt(사교육비)*200, label=과목, hjust=hjust),
            color='black', size=4,
            angle=lb$angle, inherit.aes=FALSE,
            family="HUIncludemyungjo140",
            )

part_high_all
test <- part_high_all |>
ggplot( aes(x=year, y=사교육비, fill=과목)) + 
  geom_area(alpha=0.6 , size=.5, colour="white") +
  scale_fill_viridis(discrete = T) +
  theme_ipsum() + 
  ggtitle("stack area")
test  

ggplotly(test)
part_radar <- part2[, c(1:2, 6:11, 13:16)]
colnames(part_radar) <- c("year","school","국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양")
part_radar
# radar

min.max.scale<-function (x) {
  return ((x-min(x))/(max(x)-min(x)))
}

part_radar$국어 <- min.max.scale(part_radar$국어)
part_radar$영어 <- min.max.scale(part_radar$영어)
part_radar$수학 <- min.max.scale(part_radar$수학)
part_radar$`사회,과학` <- min.max.scale(part_radar$`사회,과학`)
part_radar$논술 <- min.max.scale(part_radar$논술)
part_radar$제2과목 <- min.max.scale(part_radar$제2과목)
part_radar$음악 <- min.max.scale(part_radar$음악)
part_radar$미술 <- min.max.scale(part_radar$미술)
part_radar$체육 <- min.max.scale(part_radar$체육)
part_radar$`취미,교양` <- min.max.scale(part_radar$`취미,교양`)

view(part_radar)
data <- part_radar[part_radar$year==2007,c(3:12)]

colors_border=c( rgb(0,1,0.4,0.9), rgb(1,0.2,0.4,0.9) , rgb(0.4,0.2,0.8,0.9) )
colors_in=c( rgb(0,1,0.4,0.4), rgb(1,0.2,0.4,0.4) , rgb(0.4,0.2,0.8,0.4) )


data <- rbind(rep(1,10) , rep(0,10) , data)
data
radarchart(data, axistype=1, 
            pcol=colors_border, pfcol=colors_in , plwd=4 , 
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8, vlcex=0.8) +
legend(x=1, y=1, legend = c("초","중","고"), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)         
           
