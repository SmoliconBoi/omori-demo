SMODS.Joker{ --Release Energy
    key = "releaseenergy",
    config = {
        extra = {
            mult = 10
        }
    },
    loc_txt = {
        ['name'] = 'Release Energy',
        ['text'] = {
            [1] = 'Cards held in {C:attention}final hand{} of',
            [2] = 'round each give {C:red}+#1#{} Mult'
        }
    },
    pos = {
        x = 1,
        y = 2
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
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and G.GAME.current_round.hands_left == 0 then
            if context.other_card.debuff then
                return {
                    message=localize('k_debuffed'),
                    colour=G.C.RED
                }
            else
                return {
                    mult=card.ability.extra.mult
                }
            end
        end
    end
}