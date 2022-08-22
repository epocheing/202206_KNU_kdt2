rm(list=ls())
Sys.setlocale("LC_ALL", "korean") # 한글 안쳐짐

library(tidyverse)
library(gganimate)
library(nord)
library(viridis)
library(gapminder)
library(ggplot2)
library(av)
library(hrbrthemes)
library(plotly)
library(packcircles)

# 혜진이 코드
# part<-read.csv('./gunyoung/부모님.csv',header=T,fileEncoding="euc-kr")
# 
# colnames(part) <- c('year', 'category', 'subject', 'father', 'mother')
# colnames(part)
# 
# p<-ggplot(part, aes(father, mother, size = category, color = subject)) +
#   geom_point(size=5) +
#   #theme(legend.key.size = unit(3, "cm")) +
#   theme_classic() +
#   theme(legend.justification = "top") +
#   #labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
#   transition_states(year)
# ggplotly(p)

### esquisse한 그래프 그리기
clibrary(esquisse)
esquisser(childsu.typerate.df)

# -------------------------------------------------------------------------
# 내가 짠 코드
## 데이터 불러오기
chil_edu_rat<-read.csv('./gunyoung/chil_edu_rat.csv',header=T,fileEncoding = 'euc-kr')
colnames(chil_edu_rat)<-c('type','year','one','two','two-one','two-two','third','third-one','third-two','third-third')
str(chil_edu_rat)
View(chil_edu_rat)
comment('열에는 타입/유형/첫째~둘째 ... 이런 식')

## 대분류별 년도별 비율 비교 
chil_edu_rat|>
  dplyr::filter(str_detect(type,'과목'))|>
  select(c(1,2,3,4,7))|>
  ggplot(aes(year,one,group=type,col=type))+
  geom_line(lwd=3)

# -------------------------------------------------------------------------
## 데이터불러오기
typerate.df<-read.csv('./gunyoung/typerate.csv',header=T,fileEncoding = 'euc-kr')
colnames(typerate.df)<-c('year','childsu','distri','educapar','subjectprivate','kor','eng','math','socsci','essay','forelan','subjecthobby','mus','art','phy','res','subjectemploy','subjectcareer','typeprivate','priprituro','grotuto','priinstitute','privisit','priinternet','typehobby','hoprituto','hogrotuto','hoinstivate','hovisit')
str(typerate.df)
View(typerate.df)

# -------------------------------------------------------------------------

### 원하는 데이터셋으로 만들기(자녀 수 당 데이터)
typerate.df$year<-factor(typerate.df$year)
childsu.typerate.df<-typerate.df|>
  filter(str_detect(childsu,'명'))
View(childsu.typerate.df)

# -------------------------------------------------------------------------

### 원하는 데이터셋으로 만들기(자녀 종류별)
childkind<-typerate.df|>
  filter(childsu %in% c('1명 (%)','- 첫째 (%)','- 둘째 (%)','- 셋째 이상 (%)'))
childkind$childsu<-c('외동','2명 중 첫째','2명 중 둘째','다자녀 중 첫째','다자녀 중 둘째','다자녀 중 셋째 이상')
View(childkind)

#### 피벗으로 대분류 과목 묶기
childkind.pv<-pivot_longer(childkind,
                           cols = c('subjectprivate','subjecthobby','subjectemploy','subjectcareer'),
                           names_to = "subject",
                           values_to = "value",
                           names_sep = NULL,
                           values_drop_na = F)
childkind.pv<-childkind.pv[,c(1,2,26,27,3:25)]
str(childkind.pv)
View(childkind.pv)

# -------------------------------------------------------------------------

### 원하는 데이터셋으로 만들기(자녀 순위별)
childrank<-typerate.df|>
  filter(childsu %in% c('1명 (%)','- 첫째 (%)','- 둘째 (%)','- 셋째 이상 (%)'))|>
  group_by(year,childsu)|>
  summarise(total=sum(distri),.groups='drop')
childrank$childsu<-rep(c('둘째','셋째 이상','첫째','외동'),5)
str(childrank)
View(childrank)

# -------------------------------------------------------------------------

### 자녀 수 당 비율을 도넛 그래프
comment('https://bookdown.org/content/b298e479-b1ab-49fa-b83d-a57c2b034d49/part.html#grouped-and-stacked-barplot')

#### 사전작업
year.max.min<-childsu.typerate.df|>
  group_by(year)|>
  summarise(ymax=cumsum(distri))
year.max.min$ymax<-ifelse(year.max.min$ymax>=100,100,year.max.min$ymax)
year.max.min
comment('누적합을 구함')

year.max.min$ymin<-c(0,head(year.max.min$ymax,n=-1))
year.max.min$ymin<-ifelse(year.max.min$ymin==100,0,year.max.min$ymin)
View(year.max.min)
comment('그전의 확률값을 구함')

year.max.min<-cbind(childsu.typerate.df,year.max.min[,-1]) # 열결합

year.max.min|>
  filter(year==2017)|>
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

# -------------------------------------------------------------------------

### 자녀 종류별 스택 막대그래프 그리기
comment('https://bookdown.org/content/b298e479-b1ab-49fa-b83d-a57c2b034d49/part.html#grouped-and-stacked-barplot')
childkind.pv|>
  filter(year==2017)|>
  ggplot(aes(x=childsu,y=value,fill=subject,group=subject))+
  geom_bar(stat="identity",colour='black')+
  theme_classic()+
  theme(axis.text.x=element_text(angle=90, hjust=1))
str(childkind.pv) 

# -------------------------------------------------------------------------

### 자녀 순위별 원형패킹 그래프
View(childrank)

childrank_year<-childrank|>
  filter(year==2017)
childrank_year
packing <- circleProgressiveLayout(childrank$total, sizetype='area')
comment('각 원이 겹치지 않게 원 중심과 크기를 계산해줌')

childrank_year.pack <- cbind(childrank, packing)

dat.gg <- circleLayoutVertices(packing, npoints=50)
comment('각 원의 원주에 있는 점을 계산해줌')

ggplot() + 
  geom_polygon(dat.gg, mapping=aes(x, y, group = id, fill=as.factor(id)), colour = "black", alpha = 0.6) +
  geom_text(childrank.pack, mapping=aes(x, y, size=childsu, label = childsu)) +
  #scale_size_continuous(range = c(1,4)) +
  theme_void() + 
  theme(legend.position="none") +
  coord_equal()
dat.gg
# -------------------------------------------------------------------------




















