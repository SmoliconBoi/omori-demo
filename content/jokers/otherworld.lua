SMODS.Joker{ --Otherworld
    key = "otherworld",
    config = {
        extra = {
            poker_hand = "Two Pair"
        }
    },
    loc_txt = {
        ['name'] = 'Otherworld',
        ['text'] = {
            [1] = 'Create a {C:planet}Planet{}',
            [2] = 'card if played hand',
            [3] = 'contains a {C:attention}#1#{}',
            [4] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize(card.ability.extra.poker_hand, 'poker_hands')}}
    end,
    calculate = function (self,card,context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.poker_hand]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Planet',
                                key_append = 'j_omori_otherworld'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet
                }
        end
    end
}