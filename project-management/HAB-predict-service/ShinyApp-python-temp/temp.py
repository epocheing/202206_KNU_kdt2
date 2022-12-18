from shiny import App, render, ui
from shiny.types import ImgData
from pathlib import Path

app_ui = ui.page_fluid(
    ui.panel_title("적조 알라미 ver1.0"),
    ui.panel_sidebar(
        ui.navset_tab(
            ui.nav("적조 예측", ui.output_image("hab")),
            ui.nav("위치 정보", ui.output_image("gps")),
            ui.nav("적조 정보", ui.output_image("map")),
            ui.nav("날씨 정보", ui.output_image("weather")),
            ui.nav("관광 정보", ui.output_image("tour")),
        )
    ),
)


def server(input, output, session):
    @output
    @render.image
    def hab():
        dir = Path(__file__).resolve().parent
        img: ImgData = {"src": str(dir / "image/hab.png"), "width": "600px"}
        return img

    @output
    @render.image
    def gps():
        dir = Path(__file__).resolve().parent
        img: ImgData = {"src": str(dir / "image/gps.png"), "width": "600px"}
        return img

    @output
    @render.image
    def map():
        dir = Path(__file__).resolve().parent
        img: ImgData = {"src": str(dir / "image/map.png"), "width": "600px"}
        return img

    @output
    @render.image
    def weather():
        dir = Path(__file__).resolve().parent
        img: ImgData = {"src": str(dir / "image/weather.png"), "width": "600px"}
        return img

    @output
    @render.image
    def tour():
        dir = Path(__file__).resolve().parent
        img: ImgData = {"src": str(dir / "image/tour.png"), "width": "600px"}
        return img


app = App(app_ui, server)
