local joker_index = {
    "lightbulb",
    "mewo",
    "redhand",
    "laptop",
    "shinyknife",
    "neighboursroom",
    "bigyellowcat",
    "watermelon",
    "mrplantegg",
    "hector",
    "vastforest",
    "picnicbasket",
    "boss",
    "sproutmole",
    "yeoldsprout",
    "releaseenergy",
    "jash",
    "bunnyherd",
    "mailbox",
    "kitekid",
    "otherworld",
    "recyclingmachine",
    "lifejam",
    "unidentifiedflyingorange",
    "downloadwindow",
    "specialmixtape",
    "plutohs",
    "captspaceboy",
    "universalremote",
    "coffee",
    "daddylonglegs",
    "kingcrawler",
    "kingcarnivore",
    "sirmaximus",
    "sweetheart",
    "lostlibrary",
    "leafie",
    "spellingbee",
    "gingerdeadman",
    "celebratoryposter",
    "hectorjr",
    "snaley",
    "squizzard",
    "poolnoodle",
    "ghostparty",
    "mrjawsum",
    "apple",
    "humphrey",
    "watermimic",
    "slimegirls",
    "mysterypotion",
    "jackson",
    "recyclepath",
    "petrock",
    "photoalbum",
    "blackedoutphotograph",
    "pinwheel",
    "orangejoe",
    "whitetulip",
    "gladiolus",
    "cactus",
    "redrose",
    "sunflower",
    "lilyofthevalley",
    "whitegretorchid",
    "toyboxkey",
    "acrophobia",
    "thalassophobia",
    "omoli",
    "catbutler",
    "loquaciouscat",
    "loveletter",
    "something",
    "marirw",
    "mytime"
}
local unfinished_joker_index = {
    "herohs",
    "marihs",
    "orangeoasis",
--    "bossmanhero",
    "themaverick",
    "sunny",
    "aubreyrw",
    "herorw",
    "basilrw",
    "goodmorning"
}

SMODS.Atlas({
    key = "OMO_jokers", 
    path = "jokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

for i = 1, #joker_index do
    SMODS.load_file('content/jokers/'..joker_index[i]..'.lua')()
end
if OMORI.config.unfinished_jokers then
    for i = 1, #unfinished_joker_index do
        SMODS.load_file('content/jokers/'..unfinished_joker_index[i]..'.lua')()
    end
end

secret_hand_list = {} --secret hand setup (based off of Ortalab's secret hand list)
for k, v in pairs(Game.init_game_object(self).hands) do
    if v.visible == false then table.insert(secret_hand_list, k) end
end
