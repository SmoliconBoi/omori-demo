SMODS.Joker{ --JACKSON
    key = "jackson",
    loc_txt = {
        ['name'] = 'JACKSON',
        ['text'] = {
            [1] = 'If {C:attention}last discard{} of',
            [2] = 'round has only {C:attention}1{}',
            [3] = 'card, destroy it'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'OMO_jokers',

    calculate = function(self, card, context)
        if context.hand_drawn and not context.blueprint then
            if G.GAME.current_round.discards_left == 1 then
                local eval = function(card) return G.GAME.current_round.discards_left == 1 and not G.RESET_JIGGLES end
                juice_card_until(card, eval, true)
            end
        end
        if context.discard  and not context.blueprint then
            if (G.GAME.current_round.discards_left == 1 and #context.full_hand == 1) then
                play_sound("slice1", 0.96 + math.random() * 0.08)
                return {
                    remove = true,
                    message = "Catched!"
                }
            end
        end
    end
}