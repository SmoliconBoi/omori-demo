SMODS.Joker{ --Pinwheel
    key = "pinwheel",
    config = {
        extra = {
            hand_size = 3,
            discards = 1
        }
    },
    loc_txt = {
        ['name'] = 'Pinwheel',
        ['text'] = {
            [1] = '{C:attention}+#1#{} hand size,',
            [2] = '{C:red}-#2#{} discard',
            [3] = 'each round'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars=function(self,info_queue,card)
        return{vars={card.ability.extra.hand_size,card.ability.extra.discards}}
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(3)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        ease_discard(-card.ability.extra.discards)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-3)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        ease_discard(card.ability.extra.discards)
    end
}