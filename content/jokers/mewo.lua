SMODS.Joker{ --MEWO
    key = "mewo",
    config = {
        extra = {
            remaining = 3,
            every = 3
        }
    },
    loc_txt = {
        ['name'] = 'MEWO',
        ['text'] = {
            [1] = 'Create a random',
            [2] = '{C:tarot}Tarot{} card every',
            [3] = '{C:attention}#1#{} {C:inactive}[#2#]{} hands played',
            [4] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {
                card.ability.extra.every + 1,
                card.ability.extra.remaining + 1}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.remaining = (card.ability.extra.every - 1 - (G.GAME.hands_played - card.ability.hands_played_at_create)) %
                (card.ability.extra.every + 1)
            if not context.blueprint then
                if card.ability.extra.remaining == 0 then
                    local eval = function(card) return card.ability.extra.remaining == 0 and not G.RESET_JIGGLES end
                    juice_card_until(card, eval, true)
                end
            end
            if (card.ability.extra.remaining == card.ability.extra.every) and (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card {
                                    set = 'Tarot',
                                    key_append = 'j_omori_marihs'
                                }
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                return{
                    message = localize('k_plus_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot
                }
            end
        end
    end,
        add_to_deck = function(self, card, from_debuff)
            play_sound("omori_mewo")
        end
}