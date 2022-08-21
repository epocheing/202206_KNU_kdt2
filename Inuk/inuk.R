library(tidyverse)
library(ggmap)
library(plotly)
library(gganimate)


# 구글지도 api 키 저장
register_google(key = "AIzaSyBKvo0pl7gf3KVUAWwQ_h8Hw2z5h40UgFM")
# 구글지도에서 한국지도 불러오기
map <- get_map(location = "south korea", zoom = 7, maptype = "roadmap", color = "bw")

# 데이터 불러오기
df <- read.csv("data.csv", header = TRUE)

# 불러온 데이터 확인
str(df)

# 지도에 그릴 데이터 정리
map_hangmok <- c("서울", "광역시", "중소도시", "읍면지역")
make_map <- subset(df, 항목 %in% map_hangmok)

# 지도에 그리기
p <- ggmap(map) +
    geom_point(
        data = make_map[make_map$시점 == 2010, ],
        aes(x = long, y = lat, size = 사교육비, color = 항목, alpha = 0.5)
    ) +
    scale_size_continuous(range = c(5, 10)) +
    theme_void() +
    coord_map()


p <- ggplotly(p)
p
