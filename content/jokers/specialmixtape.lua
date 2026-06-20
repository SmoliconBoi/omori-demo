SMODS.Joker{ --Special Mixtape
    key = "specialmixtape",
    config = {
        extra = {
            mult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Special Mixtape',
        ['text'] = {
            [1] = 'Each card with {C:clubs}Club{} suit',
            [2] = 'held in hand gives {C:red}+#1#{} Mult'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_suit("Clubs") then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}