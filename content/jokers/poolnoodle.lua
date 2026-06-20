SMODS.Joker{ --Pool Noodle
    key = "poolnoodle",
    config = {
        extra = {
            amount = 10,
            discount = 25
        }
    },
    loc_txt = {
        ['name'] = 'Pool Noodle',
        ['text'] = {
            [1] = 'All cards and packs',
            [2] = 'in the next {C:attention}#1#{} shops',
            [3] = 'are {C:attention}#2#%{} off'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    in_pool = function(self, args)
    return (not G.GAME.pool_flags.omori_poolnoodle_borrowed)
    end,  

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.amount,card.ability.extra.discount}}
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint then
            if card.ability.extra.amount <= 1 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                message = "Borrowed!"
                }
            else
                card.ability.extra.amount = card.ability.extra.amount - 1
                return {
                message = card.ability.extra.amount..''
                }
            end
        end
    end,
    
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.discount
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.pool_flags.omori_poolnoodle_borrowed = true
        G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.discount
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
}