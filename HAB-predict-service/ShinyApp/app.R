library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style('
    ul.nav-pills{
      display: flex !important;
      justify-content: center !important;
    }')
  ),
  titlePanel(h1(HTML('<div calss="center">',
                  '<span style=" font: bold 1.5em Comic Sans MS, serif ;">', 
                  '적조 알리미',
                  '</span>',
                  'Ver. 01',
                  '</div>'),
                  align = "center")),
    tabsetPanel(type='pills',
      tabPanel('적조 예측',
               imageOutput("Image_alr"), align="center"),
      tabPanel('위치 정보',
               imageOutput("Image_loc"), align="center"),
      tabPanel('적조 정보',
               imageOutput("Image_2"), align="center"),
      tabPanel('날씨 정보',
               imageOutput("Image_3"), align="center"),
      tabPanel('관광 정보',
               imageOutput("Image_4"), align="center")
    )
    
)

server <- function(input, output, session) {
  
  output$Image_alr <- renderImage(
    deleteFile = F,{
      width  <- session$clientData$output_pic_1_width
      height <- session$clientData$output_pic_1_height
      list(src = "image\\적조경보.png",
           width = width-200,
           height = width * 0.75-200)
    })
  
  output$Image_loc <- renderImage(
    deleteFile = F,{
      width  <- session$clientData$output_pic_1_width
      height <- session$clientData$output_pic_1_height
      list(src = "image\\위치정보.png",
           width = width-200,
           height = width * 0.75-200)
    })
  
  output$Image_2 <- renderImage(
    deleteFile = F,{
    width  <- session$clientData$output_pic_1_width
    height <- session$clientData$output_pic_1_height
    list(src = "image\\지도.png",
         width = width-200,
         height = width * 0.75-200)
  })
  
  output$Image_3 <- renderImage(
    deleteFile = F,{
      width  <- session$clientData$output_pic_1_width
      height <- session$clientData$output_pic_1_height
      list(src = "image\\날씨.png",
           width = width-200,
           height = width * 0.75-200)
    })
  
  output$Image_4 <- renderImage(
    deleteFile = F,{
      width  <- session$clientData$output_pic_1_width
      height <- session$clientData$output_pic_1_height
      list(src = "image\\관광.png",
           width = width-200,
           height = width * 0.75-200)
    })
}


shinyApp(ui, server)

