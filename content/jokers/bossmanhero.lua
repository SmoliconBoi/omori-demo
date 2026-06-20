SMODS.Joker{ --BOSSMAN HERO
    key = "bossmanhero",
    config = {
        extra = {
            price = 2
        }
    },
    loc_txt = {
        ['name'] = 'BOSSMAN HERO',
        ['text'] = {
            [1] = 'Gains {C:money}$#1#{} of sell value for',
            [2] = 'each {C:attention}consumable{} held',
            [3] = 'when {C:attention}Blind{} is selected'
        },
    },
    pos = {
        x = 3,
        y = 6
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.price}}
    end,
    
    calculate = function(self,card,context)
        if context.setting_blind and #G.consumeables.cards > 0 and not context.blueprint then
            card.ability.extra_value = card.ability.extra_value + #G.consumeables.cards * card.ability.extra.price
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}