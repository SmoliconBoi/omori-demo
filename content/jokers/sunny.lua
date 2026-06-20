SMODS.Joker{ --Sunny
    key = "snuuy",
    config = {
        extra = {
            percent = 50
        }
    },
    loc_txt = {
        ['name'] = 'Sunny',
        ['text'] = {
            [1] = 'Create a {C:spectral}Spectral{}',
            [2] = 'card at end of round',
            [3] = 'if chips scored are',
            [4] = 'over {C:attention}#1#%{} of {C:attention}Blind{}',
            [5] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 7,
        y = 10
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.percent}}
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval
        and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(1+(card.ability.extra.percent/100)) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'j_omori_snuuy'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end
        end
    end
}