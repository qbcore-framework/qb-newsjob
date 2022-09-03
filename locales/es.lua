local Translations = {
    text = {
        weazle_overlay = "Transmitir noticia en vivo ~INPUT_PICKUP~ \nGrabar noticia: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "Vehículos Weazel News",
        close_menu = "⬅ Cerrar menu",
        weazel_news_helicopters = "Helicopteros Weazel News",
        store_vehicle = "~g~E~w~ - Guardar vehículo",
        vehicles = "~g~E~w~ - Vehículos",
        store_helicopters = "~g~E~w~ - Guardar Helicoptero",
        helicopters = "~g~E~w~ - Helicopteros",
        enter = "~g~E~w~ - Entrar",
        go_outside = "~g~E~w~ - Salir",
        breaking_news= "¡NOTICIA DE ULTIMA HORA!"
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
