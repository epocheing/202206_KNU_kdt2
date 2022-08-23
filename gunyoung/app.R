library(shiny)

## 데이터불러오기
typerate.df<-read.csv('./gunyoung/typerate.csv',header=T,fileEncoding = 'euc-kr')
colnames(typerate.df)<-c('year','childsu','distri','educapar','subjectprivate','kor','eng','math','socsci','essay','forelan','subjecthobby','mus','art','phy','res','subjectemploy','subjectcareer','typeprivate','priprituro','grotuto','priinstitute','privisit','priinternet','typehobby','hoprituto','hogrotuto','hoinstivate','hovisit')

# -------------------------------------------------------------------------

### 원하는 데이터셋으로 만들기(자녀 수 당 데이터)
typerate.df$year<-factor(typerate.df$year)
childsu.typerate.df<-typerate.df|>
  filter(str_detect(childsu,'명'))

# -------------------------------------------------------------------------

### 원하는 데이터셋으로 만들기(자녀 종류별)
childkind<-typerate.df|>
  filter(childsu %in% c('1명 (%)','- 첫째 (%)','- 둘째 (%)','- 셋째 이상 (%)'))
childkind$childsu<-c('외동','2명 중 첫째','2명 중 둘째','다자녀 중 첫째','다자녀 중 둘째','다자녀 중 셋째 이상')


#### 피벗으로 대분류 과목 묶기
childkind.pv<-pivot_longer(childkind,
                           cols = c('subjectprivate','subjecthobby','subjectemploy','subjectcareer'),
                           names_to = "subject",
                           values_to = "value",
                           names_sep = NULL,
                           values_drop_na = F)
childkind.pv<-childkind.pv[,c(1,2,26,27,3:25)]

# -------------------------------------------------------------------------

### 원하는 데이터셋으로 만들기(자녀 순위별)
childrank<-typerate.df|>
  filter(childsu %in% c('1명 (%)','- 첫째 (%)','- 둘째 (%)','- 셋째 이상 (%)'))|>
  group_by(year,childsu)|>
  summarise(total=sum(distri),.groups='drop')
childrank$childsu<-rep(c('둘째','셋째 이상','첫째','외동'),5)

# -------------------------------------------------------------------------

ui<-fluidPage(
  tags$h1('건영이의 시각화'),
  selectInput('year',label='년도',choices=unique(typerate.df$year)),
  plotOutput('displot2')
)

server<-function(input,output){
  # output$displot1<-renderPlot({
  #   childkind.pv|>
  #     filter(year==input$year)|>
  #     ggplot(aes(x=childsu,y=value,fill=subject,group=subject))+
  #     geom_bar(stat="identity",colour='black')+
  #     theme_classic()+
  #     theme(axis.text.x=element_text(angle=90, hjust=1))
  # })
  
  output$displot2<-renderPlot({
    year.max.min<-childsu.typerate.df|>
      group_by(year)|>
      summarise(ymax=cumsum(distri))
    year.max.min$ymax<-ifelse(year.max.min$ymax>=100,100,year.max.min$ymax)

    year.max.min$ymin<-c(0,head(year.max.min$ymax,n=-1))
    year.max.min$ymin<-ifelse(year.max.min$ymin==100,0,year.max.min$ymin)
    
    year.max.min<-cbind(childsu.typerate.df,year.max.min[,-1]) # 열결합
    
    year.max.min|>
      filter(year==input$year)|>
      ggplot(aes(ymax=ymax, ymin=ymin, xmax=4, xmin=1, fill=childsu)) +
      geom_rect(alpha=0.3) +
      coord_polar(theta="y") +
      facet_wrap(~year,ncol=2) + 
      theme_void() +
      geom_text(x=-2,aes(y=(ymax+ymin)/2, label=paste0(substring(childsu,1,2),'\n',distri,'%'), color=childsu), size=5) + 
      scale_fill_brewer(palette=7) +
      scale_color_brewer(palette=7) +
      coord_polar(theta="y") +
      xlim(c(-7,4))
  })
  
  output$displot3<-renderPlot({
    packing <- circleProgressiveLayout(childrank$total, sizetype='area')
    
    childrank.pack <- cbind(childrank, packing)
    dat.gg <- circleLayoutVertices(packing, npoints=50)
    dat.gg<-cbind(dat.gg,childsu=rep(c('둘째','셋째 이상','첫째','외동'),each=51,times=5))
    dat.gg$year<-rep(c(2017,2018,2019,2020,2021),each=204)

    ggplot() + 
      geom_polygon(dat.gg, mapping=aes(x, y, group=as.factor(id), fill=childsu), colour = "black", alpha = 0.6) +
      geom_text(childrank.pack,mapping=aes(x, y, label = childsu)) +
      #scale_size_continuous(range = c(1,4)) +
      theme_void() +
      geom_text(x=10, y=-15, aes(label=year), data=childrank.pack,size=10,col='green')+
      theme() +
      coord_equal()+
      transition_states(childrank.pack$year)
  })
}

shinyApp(ui,server)
































