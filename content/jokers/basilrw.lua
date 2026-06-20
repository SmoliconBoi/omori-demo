SMODS.Joker{ --Basil
    key = "basilrw",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Basil',
        ['text'] = {
            [1] = 'Create a {C:tarot}Tarot{}',
            [2] = 'card if all cards',
            [3] = 'held in hand are',
            [4] = '{C:attention}face{} cards',
            [5] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    calculate = function (self,card,context)
        if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local all_faces = true
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card:is_face() then
                    all_faces = false
                    break
                end
            end
            if all_faces then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Tarot',
                                key_append = 'j_omori_basilrw'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                return {
                    message = localize('k_plus_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot
                }
            end
        end
    end
}