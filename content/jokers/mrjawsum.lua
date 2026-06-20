SMODS.Joker{ --MR. JAWSUM
    key = "mrjawsum",
    config = {
        extra = {
            dollars = 8
        }
    },
    loc_txt = {
        ['name'] = 'MR. JAWSUM',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} if {C:attention}first hand{}',
            [2] = 'of round defeats {C:attention}Blind{}'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars=function (self,info_queue,card)
        return {vars = {card.ability.extra.dollars}}
    end,

    calc_dollar_bonus = function (self,card)
        if G.GAME.current_round.hands_played == 1 then
            return card.ability.extra.dollars
        end
    end
}