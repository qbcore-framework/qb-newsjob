local Translations = {
    text = {
        weazle_overlay = "VTM overlay ~INPUT_PICKUP~ \nFilm Overlay: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "VTM nieuws voertuigen",
        close_menu = "⬅ Sluit menu",
        weazel_news_helicopters = "VTM nieuws helikopters",
        store_vehicle = "~g~E~w~ - Voertuig parkeren",
        vehicles = "~g~E~w~ - Voertuig",
        store_helicopters = "~g~E~w~ - Helikopter parkeren",
        helicopters = "~g~E~w~ - Helikopters",
        enter = "~g~E~w~ - Enter",
        go_outside = "~g~E~w~ - Naar buiten",
        breaking_news = "BREAKING NEWS",
        title_breaking_news = "7:00 AM / VTM nieuws",
        bottom_breaking_news = "We brengen je het laatste fake nieuws! Fuck de VRT!"
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
