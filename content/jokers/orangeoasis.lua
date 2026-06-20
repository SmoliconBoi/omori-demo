SMODS.Joker{ --Orange Oasis
    key = "orangeoasis",
    config = {
        extra = {
            odds = 8,
            dollars = 1
        }
    },
    loc_txt = {
        ['name'] = 'Orange Oasis',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for',
            [2] = 'each {C:attention}discarded{}',
            [3] = 'card to earn {C:money}$#3#{}'
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_orangeoasis') 
        return {vars = {new_numerator, new_denominator,card.ability.extra.dollars}}
    end,
    calculate = function (self,card,context)
        if context.discard and SMODS.pseudorandom_probability(card, 'oasis_odds', 1, card.ability.extra.odds, 'j_omori_orangeoasis', false) then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                delay = 0.45,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end
}