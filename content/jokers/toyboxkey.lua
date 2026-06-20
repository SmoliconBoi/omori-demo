SMODS.Joker{ --Toybox Key
    key = "toyboxkey",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Toy-box Key',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to create',
            [2] = 'a {C:spectral}Spectral{} card when any',
            [3] = '{C:attention}Booster Pack{} is skipped',
            [4] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 4,
        y = 9
    },
    pixel_size = { h = 95 / 1.2 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_toyboxkey') 
        return {vars = {new_numerator, new_denominator}}
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if SMODS.pseudorandom_probability(card, 'dontforget', 1, card.ability.extra.odds, 'j_omori_toyboxkey', false) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1    
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'j_omori_toybox',
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                return{
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end
        end
    end
}