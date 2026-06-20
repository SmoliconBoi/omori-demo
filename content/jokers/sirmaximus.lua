SMODS.Joker{ --SIR MAXIMUS
    key = "sirmaximus",
    config = {
        extra = {
            mult = 0,
            mult_gain = 3
        }
    },
    loc_txt = {
        ['name'] = 'SIR MAXIMUS',
        ['text'] = {
            [1] = 'Gains {C:red}+#1#{} Mult for',
            [2] = 'each {C:attention}Joker{} card sold',
            [3] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult_gain,card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if (context.selling_card and context.card.ability.set == "Joker") and not (context.blueprint and context.card == card) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}