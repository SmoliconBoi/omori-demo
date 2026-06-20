SMODS.Joker{ --Lost Library
    key = "lostlibrary",
    config = {
        extra = {
            odds = 4,
            dollars = 1
        }
    },
    loc_txt = {
        ['name'] = 'Lost Library',
        ['text'] = {
            [1] = 'Each card with {C:spades}Spade{}',
            [2] = 'suit held in hand has a',
            [3] = '{C:green}#2# in #3#{} chance to give {C:money}$#1#{}'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_combpat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card,1,card.ability.extra.odds,"j_omori_lostlibrary")
        return {vars = {card.ability.extra.dollars,new_numerator,new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:is_suit("Spades") and SMODS.pseudorandom_probability(card, 'lostlibrary', 1 ,card.ability.extra.odds, 'j_omori_lostlibrary', false) then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + 1
                return{dollars = card.ability.extra.dollars,
                    G.E_MANAGER:add_event(Event({
                    func = function ()
                        G.GAME.dollar_buffer = 0
                        return true
                    end
                    })) 
                }
            end
        end
    end
}