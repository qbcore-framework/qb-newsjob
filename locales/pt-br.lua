local Translations = {
    text = {
        weazle_overlay = "Overlay da Weazle ~INPUT_PICKUP~ \nOverlay de Filmagem: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "Veículos da Weazel News",
        close_menu = "⬅ Fechar Menu",
        weazel_news_helicopters = "Helicópteros da Weazel News",
        store_vehicle = "~g~E~w~ - Guardar o Veículo",
        vehicles = "~g~E~w~ - Veículos",
        store_helicopters = "~g~E~w~ - Guardar os Helicópteros",
        helicopters = "~g~E~w~ - Helicópteros",
        enter = "~g~E~w~ - Entrar",
        go_outside = "~g~E~w~ - Sair",
        breaking_news = "ÚLTIMAS NOTÍCIAS",
        title_breaking_news = "7:00 AM / Hoje Weazel News Exclusivo",
        bottom_breaking_news = "Nós trazemos a você as ÚLTIMAS NOTÍCIAS ao vivo enquanto acontecem"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
