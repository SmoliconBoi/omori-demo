SMODS.Joker{ --RECYCLEPATH
    key = "recyclepath",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.2
        }
    },
    loc_txt = {
        ['name'] = 'RECYCLEPATH',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X#2#{} Mult for',
            [2] = 'every {C:attention}playing card{}',
            [3] = 'removed from deck',
            [4] = '{C:inactive}(Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)   
        return {vars = {card.ability.extra.xmult,card.ability.extra.xmult_gain}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
                card.ability.extra.xmult = card.ability.extra.xmult + #context.removed*card.ability.extra.xmult_gain
            return{
                message = localize { type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult} },
                colour=G.C.RED
            }
        end
        if context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}