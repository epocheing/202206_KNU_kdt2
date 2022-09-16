library(shiny)
library(rsconnect)

# rsconnect 사용 퍼블리쉬하기
rsconnect::setAccountInfo(name = "inuk", token = "AC49C53ED5E043F2DF45DE25B28D3C6B", secret = "m/hDonWCpZ55pDxfdEHClMEWoGpxSmRltlTU9KOK")
rsconnect::deployApp("/home/jovyan/workspace/R_study/week_3/D_0819")


ui <- fluidPage(
    tags$h1("안녕 난 유희열이라고 해!"),
    tags$img(src = "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202206/20/7f8061ea-848f-421e-81c6-64ce10f19886.jpg")
)

server <- function(input, output, session) {
    # Do something here!
}


shinyApp(ui = ui, server = server)
