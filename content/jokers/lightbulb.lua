SMODS.Joker{ --Lightbulb
    key = "lightbulb",
    config = {
        extra = {
            chips = 150,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Lightbulb',
        ['text'] = {
            [1] = '{C:blue}+150{} Chips',
            [2] = '{C:green}#2# in #3#{} chance this',
            [3] = 'card is destroyed',
            [4] = 'at end of round'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'OMO_jokers',

    in_pool = function(self, args)
        return not G.GAME.pool_flags.omori_lb_shattered
    end,
    
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_lightbulb') 
        return {vars = {card.ability.extra.chips,new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'lightbulb', 1, card.ability.extra.odds, 'j_omori_lightbulb', false) then
                G.GAME.pool_flags.omori_lb_shattered = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:shatter({G.C.RED}, nil, 1.6)
                            play_sound("omori_something_disappear")
                            return true
                        end
                    }))
                return {
                message = "Shattered!"
                }
            else
                return {
                message = localize('k_safe_ex')
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}