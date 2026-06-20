SMODS.Joker{ --HERO
    key = "herohs",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'HERO',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult for each',
            [2] = '{C:attention}Consumable{} card',
            [3] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card) 
        return {vars = {card.ability.extra.mult, ((G.consumeables and #G.consumeables.cards) or 0) * card.ability.extra.mult} }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main  then
            return {
                mult = #G.consumeables.cards * card.ability.extra.mult
            }
        end
    end
}