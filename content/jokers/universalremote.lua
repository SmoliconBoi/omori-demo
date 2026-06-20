SMODS.Joker{ --Universal Remote
    key = "universalremote",
    config = {
        extra = {
            suit = "Spades"
        }
    },
    loc_txt = {
        ['name'] = 'Universal Remote',
        ['text'] = {
            [1] = 'If {C:attention}final hand{} of round',
            [2] = 'contains only {V:1}#1#{},',
            [3] = 'Create a {C:spectral}Spectral{} card',
            [4] = '{s:0.8}suit changes every round',
            [5] = '{C:inactive}(Must have room){}'
        },
    },
    pos = {
        x = 5,
        y = 3
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
        return {vars = {localize(card.ability.extra.suit, 'suits_plural'), colours = { G.C.SUITS[card.ability.extra.suit]}}}
    end,
    
    set_ability = function(self, card, initial)
        local remote_suits = {}
        for suit, _ in pairs(G.C.SUITS) do
            table.insert(remote_suits,suit)
        end
        card.ability.extra.suit = pseudorandom_element(remote_suits,"remote")
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_left == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if (context.joker_main and G.GAME.current_round.hands_left == 0) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if #context.full_hand == 1 and context.full_hand[1]:is_suit(card.ability.extra.suit) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{
                            set = 'Spectral',
                            key_append = 'j_omori_universalremote',
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                end
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local remote_suits = {}
            for suit, _ in pairs(G.C.SUITS) do
                if suit ~= card.ability.extra.suit then
                table.insert(remote_suits,suit)
                end
            end
            card.ability.extra.suit = pseudorandom_element(remote_suits,"remote")
            return {
                message = localize('k_reset')
            }
        end
    end
}