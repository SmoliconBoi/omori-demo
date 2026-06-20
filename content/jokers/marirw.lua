SMODS.Joker{ --Mari
    key = "marirw",
    config = {
        extra = {
            xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mari',
        ['text'] = {
            [1] = 'Played Enhanced',
            [2] = '{C:attention}Aces{}, {C:attention}4s{} and {C:attention}3s{}',
            [3] = 'each give {X:red,C:white}X#1#{} Mult',
            [4] = 'when scored'
        }
    },
    pos = {
        x = 8,
        y = 10
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 4 or context.other_card:get_id() == 3) and context.other_card.config.center_key ~= "c_base" then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}