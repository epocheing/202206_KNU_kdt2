from shiny import App, render, ui

app_ui = ui.page_fluid(
    ui.panel_title("적조 알라미 0.8"),
    ui.panel_sidebar(
        ui.navset_tab(
            ui.nav(
                "적조 예측",
                ui.img(
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5okJjAP9QhT5o3x3IJobB4ir-RRRql8jHsrPoWhqJwA&s"
                ),
            ),
            ui.nav(
                "위치 정보",
                ui.img(
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5okJjAP9QhT5o3x3IJobB4ir-RRRql8jHsrPoWhqJwA&s"
                ),
            ),
            ui.nav(
                "적조 정보",
                ui.img(
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5okJjAP9QhT5o3x3IJobB4ir-RRRql8jHsrPoWhqJwA&s"
                ),
            ),
            ui.nav(
                "날씨 정보",
                ui.img(
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5okJjAP9QhT5o3x3IJobB4ir-RRRql8jHsrPoWhqJwA&s"
                ),
            ),
            ui.nav(
                "관광 정보",
                ui.img(
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5okJjAP9QhT5o3x3IJobB4ir-RRRql8jHsrPoWhqJwA&s"
                ),
            ),
        )
    ),
)


def server(input, output, session):
    @output
    @render.text
    def txt():
        return f"n*2 is {input.n() * 2}"


app = App(app_ui, server)
