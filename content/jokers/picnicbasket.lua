SMODS.Joker{ --Picnic Basket
    key = "picnicbasket",
    config = {
        extra = {
            slot_gain = 1
        }
    },
    loc_txt = {
        ['name'] = 'Picnic Basket',
        ['text'] = {
            [1] = '{C:attention}+#1#{} consumable slots'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function (self,info_queue,card)
        return{ vars = {card.ability.extra.slot_gain}}
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot_gain
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot_gain
    end
}