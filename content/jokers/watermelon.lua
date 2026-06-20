SMODS.Joker{ --Watermelon
    key = "watermelon",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Watermelon',
        ['text'] = {
            [1] = 'Sell this card to',
            [2] = 'create a {C:tarot}Tarot{}',
            [3] = 'or {C:planet}Planet{} card{C:inactive,E:1}...?{}',
            [4] = '{C:inactive}(Must have room){}'
        },
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_omori_watermelon') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then                   
            if SMODS.pseudorandom_probability(card, 'omgamimic', 1, card.ability.extra.odds, 'j_omori_watermelon', true) then
                G.GAME.pool_flags.omori_omgamimic = true
                SMODS.add_card({ set = 'Joker', key = 'j_omori_watermimic', edition = card.edition })
                play_sound('timpani')
            else
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local sets = {'Tarot', 'Planet'}
                                SMODS.add_card {
                                set = pseudorandom_element(sets, 'random_consumable_set'),
                                key_append = 'j_omori_watermelon'
                                }
                            G.GAME.consumeable_buffer = 0
                            play_sound('timpani')
                            return true
                        end
                    }))
                play_sound("omori_watermelon",1,1.2)
            end
        end       
    end
}