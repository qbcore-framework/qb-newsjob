local Translations = {
    text = {
        weazle_overlay = "Weazle Overlay ~INPUT_PICKUP~ \nFilm Overlay: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "Weazel News Fahrzeuge",
        close_menu = "⬅ Menü schließen",
        weazel_news_helicopters = "Weazel News Hubschrauber",
        store_vehicle = "~g~E~w~ - Fahrzeug einlagern",
        vehicles = "~g~E~w~ - Fahrzeuge",
        store_helicopters = "~g~E~w~ - Hubschrauber einlagern",
        helicopters = "~g~E~w~ - Hubschrauber",
        enter = "~g~E~w~ - Betreten",
        go_outside = "~g~E~w~ - Nach draußen gehen",
        breaking_news = "EILMELDUNG",
        title_breaking_news = "7:00 Uhr / Heute Weazel News Exklusiv",
        bottom_breaking_news = "Wir bringen Ihnen die NEUESTEN NACHRICHTEN live, während sie geschehen"
    }
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
