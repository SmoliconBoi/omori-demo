SMODS.Joker{ --WATERMIMIC
    key = "watermimic",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'WATERMIMIC',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to',
            [2] = 'create a random',
            [3] = '{C:attention}consumable{} card',
            [4] = 'at end of round',
            [5] = '{C:inactive}(Must have room){}'
        },
    },
    pos = {
        x = 7,
        y = 6
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    in_pool = function(self, args)
        return G.GAME.pool_flags.omori_omgamimic
    end,
    
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_watermimic') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then            
            if SMODS.pseudorandom_probability(card, 'mimicthings', 1, card.ability.extra.odds, 'j_omori_watermimic', false) then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local set = G.P_CENTER_POOLS.Consumeables
                                SMODS.add_card {
                                    set = "Consumeables",
                                    key_append = 'j_omori_watermimic',
                                }
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                    return {message = "Thrown!"}
                end
            end
        end
    end
}