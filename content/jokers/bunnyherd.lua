SMODS.Joker{ --_____ BUNNY
    key = "bunnyherd",
    config = {
        extra = {
            chips = 45,
            mult = 6,
            name = "FOREST BUNNY"
        }
    },
    loc_txt = {
        ['name'] = '#3#',
        ['text'] = {
            [1] = 'Each played {C:attention}2{}',
            [2] = 'gives {C:blue}+#1#{} Chips',
            [3] = 'or {C:red}+#2#{} Mult',
            [4] = 'when scored'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips,card.ability.extra.mult,card.ability.extra.name}}
    end,

    calculate = function (self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 then
            if pseudorandom("bnuuy") <1/2 then
                return {chips = card.ability.extra.chips}
            else
                return {mult = card.ability.extra.mult}
            end
        end
    end,

    update = function (self,card,dt)
        local list = {"FOREST BUNNY","FOREST BUNNY?","DUST BUNNY","SPACE BUNNY","BUG BUNNY","GHOST BUNNY","BUN BUNNY","CUPCAKE BUNNY","MILKSHAKE BUNNY","PANCAKE BUNNY","SPROUT BUNNY","SLIME BUNNY","SNOW BUNNY"}
        card.ability.extra.name=pseudorandom_element(list)
    end
}