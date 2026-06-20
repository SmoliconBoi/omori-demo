SMODS.Joker{ --Photo Album
    key = "photoalbum",
    config = {
        extra = {
            mult = 0,
            multgain = 3
        }
    },
    loc_txt = {
        ['name'] = 'Photo Album',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+#1#{} Mult',
            [2] = 'when a played {C:attention}face{} card',
            [3] = 'is scored, resets when',
            [4] = '{C:attention}Boss Blind{} is defeated',
            [5] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 6,
        y = 7
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multgain,card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    
        if context.individual and context.cardarea == G.play and context.other_card:is_face() and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multgain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end
    
        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.mult = 0
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
}