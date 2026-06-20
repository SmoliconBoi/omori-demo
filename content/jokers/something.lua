SMODS.Joker{ --SOMETHING
    key = "something",
    config = {
        extra = {
            xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'SOMETHING',
        ['text'] = {
            [1] = 'Each Enhanced',
            [2] = '{C:attention}Ace{}, {C:attention}4{} or {C:attention}3{}',
            [3] = 'held in hand',
            [4] = 'gives {X:red,C:white}X#1#{} Mult'
        }
    },
    pos = {
        x = 4,
        y = 10
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    soul_pos = {
        x = 5,
        y = 10,
    },

    in_pool = function(self, args)
        return G.GAME.pool_flags.omori_lb_shattered
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 4 or context.other_card:get_id() == 3) and context.other_card.config.center_key ~= "c_base" then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}