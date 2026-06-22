OMORI = SMODS.current_mod

SMODS.Atlas({
    key = "modicon", 
    path = "icon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "modsplash", 
    path = "splash.png", 
    px = 333,
    py = 216,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "OMO_decks", 
    path = "decks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

assert(SMODS.load_file("sounds.lua"))()
assert(SMODS.load_file("content/jokers.lua"))()
assert(SMODS.load_file("content/decks.lua"))()

SMODS.ObjectType({
    key = "omori_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_omori_watermelon"] = true,
        ["j_omori_lifejam"] = true,
        ["j_omori_coffee"] = true,
        ["j_omori_apple"] = true,
        ["j_omori_orangejoe"] = true
    },
})

SMODS.ObjectType({
    key = "omori_unfinished",
    cards = {
        ["j_omori_herohs"] = true,
        ["j_omori_marihs"] = true,
        ["j_omori_orangeoasis"] = true,
        ["j_omori_underwaterhighway"] = true,
        ["j_omori_orangejoe"] = true,
        ["j_omori_themaverick"] = true,
        ["j_omori_sunny"] = true,
        ["j_omori_aubreyrw"] = true,
        ["j_omori_herorw"] = true,
        ["j_omori_basilrw"] = true,
        ["j_omori_goodmorning"] = true
    },
})

OMORI.config_tab = function() --configurations
	return {n = G.UIT.ROOT, config = {
			emboss = 0.05,
			r = 0.1,
			align = "cm",
			padding = 0.2,
            minw = 4,
			colour = G.C.BLACK
	}, nodes = {
		create_toggle{
            label="Visual Secrets",
            ref_table = OMORI.config,
            ref_value = "easter_eggs"
        },
        create_toggle{
            label="Unfinished/Upcoming Jokers (Requires Restart)",
            ref_table = OMORI.config,
            ref_value = "unfinished_jokers"
        }
	}}
end

OMORI.description_loc_vars = function()
    return {background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2}
end

OMORI.optional_features = function()
    return {
        quantum_enhancements = true,
        cardareas = {} 
    }
end

--Compatibility stufs

--Malverk
if (SMODS.Mods["malverk"] or {}).can_load then
    AltTexture({
    key = 'omori_buffoon_pack',
    set = 'Booster',
    path = 'boosters.png',
    display_pos = 'p_buffoon_jumbo_1',
    keys = {'p_buffoon_normal_1', 'p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1'},
    loc_txt = {
        name = 'Headspace Edition',
    }
    })
    TexturePack({
    key = "omori_pack",
    textures = {'omori_buffoon_pack'},
        loc_txt = {
        name = 'Headspace Edition',
        text ={
            [1]='Retextures the',
            [2]='{C:attention}Buffoon Packs{} to',
            [3]='be OMORI Themed'
        }
        }
    })
end
