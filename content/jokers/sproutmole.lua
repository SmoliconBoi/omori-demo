SMODS.Joker{ --SPROUT MOLE
    key = "sproutmole",
    config = {
        extra = {
            chips = 50,
            joker_slot = 1
        }
    },
    loc_txt = {
        ['name'] = 'SPROUT MOLE',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips {C:dark_edition}and...?{}'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slot
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slot
    end
}