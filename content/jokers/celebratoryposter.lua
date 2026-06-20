SMODS.Joker{ --Celebratory Poster
    key = "celebratoryposter",
    config = {
        extra = {
            blind_reward = 15
        }
    },
    loc_txt = {
        ['name'] = 'Celebratory Poster',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at end of round',
            [2] = 'when {C:attention}Boss Blind{} is defeated'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.blind_reward}}
    end,

    calc_dollar_bonus = function(self,card)
        if G.GAME.blind.boss then
            return card.ability.extra.blind_reward
        end
    end,
}