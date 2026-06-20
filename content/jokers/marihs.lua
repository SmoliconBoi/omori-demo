SMODS.Joker{ --MARI
    key = "marihs",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'MARI',
        ['text'] = {
            [1] = 'Create a {C:tarot}Tarot{} card',
            [2] = 'if played hand has a',
            [3] = 'scoring {C:attention}Ace{}, {C:attention}4{} and {C:attention}3{}',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    
    calculate = function(self, card, context)
        if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local ranks = {
            }
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if not SMODS.has_no_rank(scoring_card) then
                    ranks[scoring_card.base.value] = true
                    end
                end
            if ranks['Ace'] and ranks['4'] and ranks['3'] then
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
    end
}