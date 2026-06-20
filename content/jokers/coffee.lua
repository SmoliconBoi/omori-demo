SMODS.Joker{ --Coffee
    key = "kelnuke",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.4,
            rounds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Coffee',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X#2#{} Mult',
            [2] = 'per round played',
            [3] = '{C:red,E:2}self destructs',
            [4] = 'after {C:attention}#3#{} rounds',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmult,card.ability.extra.xmult_gain,card.ability.extra.rounds}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.rounds - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_drank_ex'),
                }
            else
                card.ability.extra.rounds = card.ability.extra.rounds - 1
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return{
                    message = localize ('k_upgrade_ex'),
                    colour=G.C.RED
                }
            end
        end
        if context.joker_main then
            return{
                xmult=card.ability.extra.xmult
            }
        end
    end
}