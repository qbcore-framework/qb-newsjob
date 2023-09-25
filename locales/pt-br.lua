local Translations = {
    text = {
        weazle_overlay = "Overlay da Weazle ~INPUT_PICKUP~ \nOverlay do Filme: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "Veículos da Weazel News",
        close_menu = "⬅ Fechar Menu",
        weazel_news_helicopters = "Helicópteros da Weazel News",
        store_vehicle = "~g~E~w~ - Armazenar o Veículo",
        vehicles = "~g~E~w~ - Veículos",
        store_helicopters = "~g~E~w~ - Armazenar os Helicópteros",
        helicopters = "~g~E~w~ - Helicópteros",
        enter = "~g~E~w~ - Entrar",
        go_outside = "~g~E~w~ - Sair",
        breaking_news = "ÚLTIMAS NOTÍCIAS",
        title_breaking_news = "7:00 AM / Exclusivo Weazel News de Hoje",
        bottom_breaking_news = "Nós trazemos as ÚLTIMAS NOTÍCIAS ao vivo conforme acontecem"
    }
}


if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end