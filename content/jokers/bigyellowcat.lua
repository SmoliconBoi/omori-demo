SMODS.Joker{ --BIG YELLOW CAT
    key = "bigyellowcat",
    config = {
        extra = {
            xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'BIG YELLOW CAT',
        ['text'] = {
            [1] = 'Each {C:attention}Joker{} card',
            [2] = 'gives {X:red,C:white}X#1#{} Mult on',
            [3] = '{C:attention}final hand{} of round'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.other_joker and G.GAME.current_round.hands_left == 0 then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}