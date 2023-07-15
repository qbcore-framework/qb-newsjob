local Translations = {
    text = {
        weazle_overlay = "Weazle Overlay ~INPUT_PICKUP~ \nFilm Overlay: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "Weazel News Køretøjer",
        close_menu = "⬅ Luk Menuen",
        weazel_news_helicopters = "Weazel News Helikoptere",
        store_vehicle = "~g~E~w~ - Gem køretøjet",
        vehicles = "~g~E~w~ - Køretøjer",
        store_helicopters = "~g~E~w~ - Gem helikoptere",
        helicopters = "~g~E~w~ - Helikoptere",
        enter = "~g~E~w~ - Tilgå",
        go_outside = "~g~E~w~ - Gå udenfor",
        breaking_news = "SENESTE NYT",
        title_breaking_news = "07:00 / I dag Weazel News Eksklusivt",
        bottom_breaking_news = "Vi giver dig de SENESTE NYHEDER live, når det sker"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
