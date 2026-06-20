SMODS.Joker{ --Recycling Machine
    key = "recyclingmachine",
    config = {
        extra = {
            dollars = 1
        }
    },
    loc_txt = {
        ['name'] = 'Recycling Machine',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} per {C:attention}discard{}',
            [2] = 'used at end of round'
        }
    },
    pos = {
        x = 7,
        y = 2

    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end, 
    
    calc_dollar_bonus = function(self, card)
        local blind_reward = G.GAME.current_round.discards_used * card.ability.extra.dollars
        if blind_reward > 0 then
            return blind_reward
        end
    end,
}