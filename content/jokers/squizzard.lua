SMODS.Joker{ --SQUIZZARD
    key = "squizzard",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'SQUIZZARD',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for',
            [2] = 'played {C:attention}Wild Cards{}',
            [3] = 'to create a {C:tarot}Tarot{}',
            [4] = 'card when scored',
            [5] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 7,
        y = 5
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    enhancement_gate = "m_wild",
    atlas = 'OMO_jokers',
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["m_wild"]
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_squizzard') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if SMODS.has_enhancement(context.other_card,"m_wild") and SMODS.pseudorandom_probability(card, 'squid_ward', 1, card.ability.extra.odds, 'j_omori_squizzard', false) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = localize('k_plus_tarot'),
                        message_card = card,
                        func = function() 
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card {
                                        set = 'Tarot',
                                        key_append = 'j_omori_squizzard'
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                    },
                }
            end
        end
    end
}