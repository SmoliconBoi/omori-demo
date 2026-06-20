SMODS.Joker{ --LEAFIE
    key = "leafie",
    config = {
        extra = {
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'LEAFIE',
        ['text'] = {
            [1] = 'If {C:attention}first hand{} of',
            [2] = 'round is a single',
            [3] = '{C:attention}2{}, destroy it',
            [4] = 'and earn {C:money}$#1#{}'
        }
    },
    pos = {
        x = 4,
        y = 4
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars}}
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.destroying_card and not context.blueprint then
            if G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
                if context.full_hand[1] and context.full_hand[1]:get_id() == 2 then
                    return {
                        dollars = card.ability.extra.dollars,
                        remove = true
                    }
                end
            end
        end
    end
}