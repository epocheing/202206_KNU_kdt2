from shiny import App, render, ui
from shiny.types import ImgData

app_ui = ui.page_fluid(
    ui.panel_title("적조 알라미 ver1.0"),
    ui.panel_sidebar(
        ui.input_selectize(
            id="image",
            label="매뉴",
            choices={
                "hab.png": "적조 예측",
                "gps.png": "위치 정보",
                "map.png": "적조 정보",
                "weather.png": "날씨 정보",
                "tour.png": "관광 정보",
            },
        )
    ),
    ui.panel_main(ui.output_image("img")),
)


def server(input, output, session):
    @output
    @render.image
    def img():
        from pathlib import Path

        dir = Path(__file__).resolve().parent
        name = str(input.image())
        img: ImgData = {"src": str(dir / "image/" / name), "width": "600px"}
        return img


app = App(app_ui, server)
