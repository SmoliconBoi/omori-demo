SMODS.Joker{ --KID'S KITE (REWORK THIS)
    key = "kitekid",
    config = {
        extra ={
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'KID\'S KITE',
        ['text'] = {
            [1] = 'Retrigger all',
            [2] = 'played {C:attention}Aces{}',
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end,
}