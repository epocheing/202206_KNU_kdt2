library(shiny)
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
library(fmsb)

part <- read.csv("C:\\RPROJECT\\MyProject\\학교급별.csv", fileEncoding = "euc-kr")
part2 <- part[part["항목"] != "일반고 (만원)",]
colnames(part2)[1] <- "year" 
colnames(part2)[2] <- "school"
colnames(part2)[4] <- "pri_exp"

part4 <- part2[part2["school"]=="고등학교 (만원)", c(1:2, 18:22)]
part5 <- part2[part2["school"]=="중학교 (만원)", c(1:2, 18:22)]
part6 <- part2[part2["school"]=="초등학교 (만원)", c(1:2, 18:22)]
# 고등
part_high_all <- part2[part2["school"]=="고등학교 (만원)", c(1:2, 6:11, 13:16)]
colnames(part_high_all) <- c("year","school","국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양")

part_high_all <- pivot_longer(
  part_high_all,
  cols = c("국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양"),
  names_to = "과목",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)

# 중등
part_mid_all <- part2[part2["school"]=="중학교 (만원)", c(1:2, 6:11, 13:16)]
colnames(part_mid_all) <- c("year","school","국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양")

part_mid_all <- pivot_longer(
  part_mid_all,
  cols = c("국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양"),
  names_to = "과목",
  values_to = "사교육비",
  names_sep = NULL,
  values_drop_na = F
)
# 초등
part_ele_all <- part2[part2["school"]=="초등학교 (만원)", c(1:2, 6:11, 13:16)]
colnames(part_ele_all) <- c("year","school","국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양")

part_ele_all <- pivot_longer(
  part_ele_all,
  cols = c("국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양"),
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
part_radar <- part2[, c(1:2, 6:11, 13:16)]
colnames(part_radar) <- c("year","school","국어","영어","수학","사회,과학","논술","제2과목","음악","미술","체육","취미,교양")

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

ui<-pageWithSidebar(
  headerPanel(h1('학교급별 평균 사교육비')),
  
  sidebarPanel(
    selectInput('year', '년도를 입력하세요.',
                selected=TRUE,
                choices=part_radar$year)
    
  ),

  mainPanel(
    tabsetPanel(
      tabPanel(HTML('<span style=" font: italic bold 1em Comic Sans MS, serif ;">',
                    'School part',
                    '</span>'),
               
               #img(src="./img.gif", align = 'left', height = '250px', width = '500x')
      ),
      tabPanel(HTML('<span style=" font: italic bold 1em Comic Sans MS, serif ;">',
                    'School part',
                    '</span>'),
                plotlyOutput("partplot1", height = '800px')
                        
      ),
      tabPanel(HTML('<span style=" font: italic bold 1em Comic Sans MS, serif ;">',
                    'School Subject',
                    '</span>'),
               plotlyOutput("partplot3"),
               plotlyOutput("partplot4"),
               plotlyOutput("partplot5")
      ),
      tabPanel(HTML('<span style=" font: italic bold 1em Comic Sans MS, serif ;">',
                    'Subject Year',
                    '</span>'),
               plotOutput("partplot",height = '1000px')
               
               ),
      tabPanel(HTML('<span style=" font: italic bold 1em Comic Sans MS, serif ;">',
                    'Category part',
                    '</span>'),
               plotOutput("partplot2",height = '700px'),
               plotOutput("partplot6",height = '700px'),
               plotOutput("partplot7",height = '700px')
               
               
  )
  )

)
)
server <- function(input, output){
output$partplot<-renderPlot({
  
  data <- part_radar[part_radar$year==input$year,c(3:12)]
  
  colors_border=c( rgb(0,1,0.4,0.9), rgb(1,0.2,0.4,0.9) , rgb(0.4,0.2,0.8,0.9) )
  colors_in=c( rgb(0,1,0.4,0.4), rgb(1,0.2,0.4,0.4) , rgb(0.4,0.2,0.8,0.4) )
  
  
  data <- rbind(rep(1,10) , rep(0,10) , data)
  radarchart(data, axistype=1, 
             pcol=colors_border, pfcol=colors_in , plwd=4 , 
             cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8, vlcex=2)
    
   legend(x=1.3, y=1.3, legend = c("초","중","고"), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=2, pt.cex=3)         
  
})
output$partplot1<-renderPlotly({

  aa <- ggplot(part2, aes(x=year, y=pri_exp, group=school, color=school)) +
    geom_line(aes(lty = school),alpha = 0.6) +
    geom_point(size = 5) +
    scale_color_viridis(discrete = T) +
    theme_classic() +
    theme(axis.title=element_text(size=20)) +
    theme(axis.text.x = element_text(size=15),
          axis.text.y = element_text(size=15))
  ggplotly(aa)
})
output$partplot2<-renderPlot({
  part_cate |>
    filter(유형!="방문학습지") |>
    ggplot( aes(fill=유형, y=사교육비, x=year)) +
    ggtitle("2007 ~ 2021 고등학교 유형별 사교육비") +
    geom_bar(position="dodge", stat="identity", width = 0.7) +
    geom_text(aes(label = 사교육비), vjust = 0, color = "white", ) +
    facet_wrap(scales = 'free', . ~ 유형) +
    theme_ft_rc()
   
})
output$partplot3<-renderPlotly({
  test1 <- part_high_all |>
    ggplot( aes(x=year, y=사교육비, fill=과목)) + 
    geom_area(alpha=0.6 , size=.5, colour="white") +
    scale_fill_viridis(discrete = T) +
    theme_ipsum() + 
    ggtitle("High School")
  
  ggplotly(test1)
})
output$partplot4<-renderPlotly({
  test1 <- part_mid_all |>
    ggplot( aes(x=year, y=사교육비, fill=과목)) + 
    geom_area(alpha=0.6 , size=.5, colour="white") +
    scale_fill_viridis(discrete = T) +
    theme_ipsum() + 
    ggtitle("Middle School")
  
  ggplotly(test1)
})  
output$partplot5<-renderPlotly({
  test1 <- part_ele_all |>
    ggplot( aes(x=year, y=사교육비, fill=과목)) + 
    geom_area(alpha=0.6 , size=.5, colour="white") +
    scale_fill_viridis(discrete = T) +
    theme_ipsum() + 
    ggtitle("Elementary School")
  
  ggplotly(test1)
})  
output$partplot6<-renderPlot({
  part_cate2 |>
    filter(유형!="방문학습지") |>
    ggplot( aes(fill=유형, y=사교육비, x=year)) +
    ggtitle("2007 ~ 2021 중학교 유형별 사교육비") +
    geom_bar(position="dodge", stat="identity", width = 0.7) +
    geom_text(aes(label = 사교육비), vjust = 0, color = "white", ) +
    facet_wrap(scales = 'free', . ~ 유형) +
    theme_ft_rc()
})
output$partplot7<-renderPlot({
  part_cate3 |>
    filter(유형!="방문학습지") |>
    ggplot( aes(fill=유형, y=사교육비, x=year)) +
    ggtitle("2007 ~ 2021 초등학교 유형별 사교육비") +
    geom_bar(position="dodge", stat="identity", width = 0.7) +
    geom_text(aes(label = 사교육비), vjust = 0, color = "white", ) +
    facet_wrap(scales = 'free', . ~ 유형) +
    theme_ft_rc()
})

}


shinyApp(ui, server)